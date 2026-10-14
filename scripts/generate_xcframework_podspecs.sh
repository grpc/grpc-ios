#!/bin/bash
# Copyright 2024 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Generate static XCFramework CocoaPods podspecs:
#   1. Trunk *-XCFramework.podspec files in repo root (v1.48.0 pattern):
#      - gRPC-Core-XCFramework.podspec
#      - gRPC-C++-XCFramework.podspec
#      - gRPC-RxLibrary-XCFramework.podspec
#      - gRPC-XCFramework.podspec
#      - gRPC-ProtoRPC-XCFramework.podspec
#   2. Drop-in binary podspecs in dist/*.binary.podspec (preserving original pod names):
#      - dist/gRPC-Core.binary.podspec
#      - dist/gRPC-C++.binary.podspec
#      - dist/gRPC-RxLibrary.binary.podspec
#      - dist/gRPC.binary.podspec
#      - dist/gRPC-ProtoRPC.binary.podspec
#
# Usage:
#   ./scripts/generate_xcframework_podspecs.sh [--local-dist <DIR>] [--repo <OWNER/REPO>]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DIST_DIR="${REPO_ROOT}/dist"
GITHUB_REPO="${GITHUB_REPOSITORY:-grpc/grpc-ios}"
LOCAL_DIST=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --local-dist)
      LOCAL_DIST="$(cd "$2" && pwd)"
      shift 2
      ;;
    --repo)
      GITHUB_REPO="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

VERSION=$(grep -E "^\s*version\s*=" "${REPO_ROOT}/gRPC-Core.podspec" | head -n 1 | awk -F"['\"]" '{print $2}')
if [ -z "${VERSION}" ]; then
  echo "ERROR: Unable to determine version from gRPC-Core.podspec"
  exit 1
fi

mkdir -p "${DIST_DIR}"

if [ -n "${LOCAL_DIST}" ]; then
  BASE_URL="file://${LOCAL_DIST}"
else
  BASE_URL="https://github.com/${GITHUB_REPO}/releases/download/v${VERSION}"
fi

echo "Generating XCFramework podspecs for version ${VERSION} (Base URL: ${BASE_URL})..."

# Helper to generate gRPC-Core podspec (either gRPC-Core-XCFramework or gRPC-Core)
write_core_podspec() {
  local pod_name="$1"
  local target_file="$2"

  cat > "${target_file}" << EOF
Pod::Spec.new do |s|
  s.name     = '${pod_name}'
  version = '${VERSION}'
  s.version  = version
  s.summary  = 'Core cross-platform gRPC library, written in C (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "${BASE_URL}/gRPC-Core-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.requires_arc = false

  name = 'grpc'
  s.module_name = name
  s.header_dir = name

  s.libraries = 'c++', 'z'
  s.frameworks = 'CoreFoundation'

  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'USE_HEADERMAP' => 'NO',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO',
    'FRAMEWORK_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}"',
    'HEADER_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}/grpc.framework/Headers" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}/absl.framework/Headers" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}/openssl_grpc.framework/Headers"'
  }

  s.default_subspecs = 'Interface', 'Implementation'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Interface' do |ss|
    ss.vendored_frameworks = 'grpc.xcframework', 'openssl_grpc.xcframework', 'absl.xcframework'
  end

  s.subspec 'Implementation' do |ss|
    ss.dependency "#{s.name}/Interface", version
    ss.dependency "#{s.name}/Privacy", version
  end

  s.subspec 'CFStream-Implementation' do |ss|
    ss.dependency "#{s.name}/Implementation", version
  end
end
EOF
}

# Helper to generate gRPC-C++ podspec
write_cpp_podspec() {
  local pod_name="$1"
  local core_dep="$2"
  local target_file="$3"

  cat > "${target_file}" << EOF
Pod::Spec.new do |s|
  s.name     = '${pod_name}'
  version = '${VERSION}'
  s.version  = version
  s.summary  = 'gRPC C++ library (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "${BASE_URL}/gRPC-C++-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.requires_arc = false

  name = 'grpcpp'
  s.module_name = name
  s.header_dir = name

  s.libraries = 'c++'
  s.resource_bundles = { 'gRPCCertificates-Cpp' => ['etc/roots.pem'] }

  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_WARN_DOCUMENTATION_COMMENTS' => 'NO',
    'USE_HEADERMAP' => 'NO',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO',
    'FRAMEWORK_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${core_dep}"',
    'HEADER_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}/grpcpp.framework/Headers" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${core_dep}/grpc.framework/Headers" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${core_dep}/absl.framework/Headers"'
  }

  s.default_subspecs = 'Interface', 'Implementation'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Interface' do |ss|
    ss.vendored_frameworks = 'grpcpp.xcframework'
  end

  s.subspec 'Implementation' do |ss|
    ss.dependency "#{s.name}/Privacy", version
    ss.dependency "#{s.name}/Interface", version
    ss.dependency '${core_dep}', version
  end

  s.subspec 'Protobuf' do |ss|
    ss.dependency "#{s.name}/Interface", version
  end
end
EOF
}

# Helper to generate gRPC-RxLibrary podspec
write_rx_podspec() {
  local pod_name="$1"
  local target_file="$2"

  cat > "${target_file}" << EOF
Pod::Spec.new do |s|
  s.name     = '${pod_name}'
  version = '${VERSION}'
  s.version  = version
  s.summary  = 'Reactive Extensions library for iOS/OSX (Static XCFramework).'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "${BASE_URL}/gRPC-RxLibrary-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'

  name = 'RxLibrary'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}"'
  }

  s.default_subspec = 'Interface', 'Implementation'

  s.subspec 'Interface' do |ss|
    ss.vendored_frameworks = 'RxLibrary.xcframework'
  end

  s.subspec 'Implementation' do |ss|
    ss.dependency "#{s.name}/Interface"
  end
end
EOF
}

# Helper to generate gRPC podspec
write_grpc_podspec() {
  local pod_name="$1"
  local core_dep="$2"
  local rx_dep="$3"
  local target_file="$4"

  cat > "${target_file}" << EOF
Pod::Spec.new do |s|
  s.name     = '${pod_name}'
  version = '${VERSION}'
  s.version  = version
  s.summary  = 'gRPC client library for iOS/OSX (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "${BASE_URL}/gRPC-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'

  name = 'GRPCClient'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${rx_dep}" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${core_dep}"'
  }

  s.default_subspec = 'Interface', 'GRPCCore', 'Interface-Legacy'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Interface-Legacy' do |ss|
    ss.vendored_frameworks = 'GRPCClient.xcframework'
    ss.dependency "${rx_dep}/Interface", version
    ss.dependency "#{s.name}/Privacy", version
  end

  s.subspec 'Interface' do |ss|
    ss.dependency "#{s.name}/Interface-Legacy", version
    ss.dependency "#{s.name}/Privacy", version
  end

  s.subspec 'GRPCCore' do |ss|
    ss.resource_bundles = { 'gRPCCertificates' => ['etc/roots.pem'] }
    ss.dependency "#{s.name}/Interface-Legacy", version
    ss.dependency "#{s.name}/Interface", version
    ss.dependency "#{s.name}/Privacy", version
    ss.dependency '${core_dep}', version
    ss.dependency '${rx_dep}', version
  end

  s.subspec 'CFStream' do |ss|
    ss.dependency "#{s.name}/GRPCCore", version
  end

  s.subspec 'InternalTesting' do |ss|
    ss.dependency "#{s.name}/GRPCCore", version
  end
end
EOF
}

# Helper to generate gRPC-ProtoRPC podspec
write_protorpc_podspec() {
  local pod_name="$1"
  local grpc_dep="$2"
  local rx_dep="$3"
  local target_file="$4"

  cat > "${target_file}" << EOF
Pod::Spec.new do |s|
  s.name     = '${pod_name}'
  version = '${VERSION}'
  s.version  = version
  s.summary  = 'RPC library for Protocol Buffers, based on gRPC (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "${BASE_URL}/gRPC-ProtoRPC-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'

  name = 'ProtoRPC'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '\$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"\$(inherited)" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${pod_name}" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${grpc_dep}" "\$(PODS_XCFRAMEWORKS_BUILD_DIR)/${rx_dep}"'
  }

  s.default_subspec = 'Main', 'Legacy', 'Legacy-Header'

  s.subspec 'Legacy-Header' do |ss|
    ss.vendored_frameworks = 'ProtoRPC.xcframework'
  end

  s.subspec 'Main' do |ss|
    ss.dependency "#{s.name}/Legacy-Header", version
    ss.dependency '${grpc_dep}/Interface', version
    ss.dependency 'Protobuf', '~> 5.0'
  end

  s.subspec 'Legacy' do |ss|
    ss.dependency "#{s.name}/Main", version
    ss.dependency "#{s.name}/Legacy-Header", version
    ss.dependency '${grpc_dep}/GRPCCore', version
    ss.dependency '${rx_dep}', version
    ss.dependency 'Protobuf', '~> 5.0'
  end

  s.subspec 'CFStream' do |ss|
    ss.dependency "#{s.name}/Legacy", version
  end
end
EOF
}

# 1. Write *-XCFramework.podspec files to repo root (for CocoaPods Trunk release)
write_core_podspec     "gRPC-Core-XCFramework"      "${REPO_ROOT}/gRPC-Core-XCFramework.podspec"
write_cpp_podspec      "gRPC-C++-XCFramework"       "gRPC-Core-XCFramework" "${REPO_ROOT}/gRPC-C++-XCFramework.podspec"
write_rx_podspec       "gRPC-RxLibrary-XCFramework" "${REPO_ROOT}/gRPC-RxLibrary-XCFramework.podspec"
write_grpc_podspec     "gRPC-XCFramework"           "gRPC-Core-XCFramework" "gRPC-RxLibrary-XCFramework" "${REPO_ROOT}/gRPC-XCFramework.podspec"
write_protorpc_podspec "gRPC-ProtoRPC-XCFramework"  "gRPC-XCFramework" "gRPC-RxLibrary-XCFramework" "${REPO_ROOT}/gRPC-ProtoRPC-XCFramework.podspec"

# 2. Write drop-in binary *.podspec files to dist/ (uploaded to GitHub Release for :podspec overrides)
write_core_podspec     "gRPC-Core"      "${DIST_DIR}/gRPC-Core.podspec"
write_cpp_podspec      "gRPC-C++"       "gRPC-Core" "${DIST_DIR}/gRPC-C++.podspec"
write_rx_podspec       "gRPC-RxLibrary" "${DIST_DIR}/gRPC-RxLibrary.podspec"
write_grpc_podspec     "gRPC"           "gRPC-Core" "gRPC-RxLibrary" "${DIST_DIR}/gRPC.podspec"
write_protorpc_podspec "gRPC-ProtoRPC"  "gRPC" "gRPC-RxLibrary" "${DIST_DIR}/gRPC-ProtoRPC.podspec"

echo "Generated Trunk XCFramework podspecs in ${REPO_ROOT}:"
ls -1 "${REPO_ROOT}"/*-XCFramework.podspec
echo "Generated drop-in binary podspecs in ${DIST_DIR}:"
ls -1 "${DIST_DIR}"/*.podspec
