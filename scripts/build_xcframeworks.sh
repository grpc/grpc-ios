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

# Build static XCFrameworks for all gRPC CocoaPods (iOS device + iOS simulator)
# and package them into release .zip archives under dist/.
#
# Usage:
#   ./scripts/build_xcframeworks.sh [OUTPUT_DIR]
#
# Output archives in dist/ (or OUTPUT_DIR):
#   - gRPC-Core-<version>-xcframework.zip      (grpc.xcframework, openssl_grpc.xcframework, absl.xcframework)
#   - gRPC-C++-<version>-xcframework.zip       (grpcpp.xcframework)
#   - gRPC-RxLibrary-<version>-xcframework.zip (RxLibrary.xcframework)
#   - gRPC-<version>-xcframework.zip           (GRPCClient.xcframework)
#   - gRPC-ProtoRPC-<version>-xcframework.zip  (ProtoRPC.xcframework)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
OUTPUT_DIR="${1:-${REPO_ROOT}/dist}"
WORK_DIR="${REPO_ROOT}/.build_xcf"

VERSION=$(grep -E "^\s*version\s*=" "${REPO_ROOT}/gRPC-Core.podspec" | head -n 1 | awk -F"['\"]" '{print $2}')
if [ -z "${VERSION}" ]; then
  echo "ERROR: Unable to determine version from gRPC-Core.podspec"
  exit 1
fi

echo "================================================================"
echo "Building gRPC Static XCFrameworks for version ${VERSION}"
echo "Repository Root : ${REPO_ROOT}"
echo "Work Directory  : ${WORK_DIR}"
echo "Output Directory: ${OUTPUT_DIR}"
echo "================================================================"

rm -rf "${WORK_DIR}"
mkdir -p "${WORK_DIR}/BuilderApp" "${OUTPUT_DIR}"

# 1. Create a minimal dummy Xcode project so CocoaPods can generate Pods.xcodeproj
cat > "${WORK_DIR}/BuilderApp/main.m" << 'EOF'
#import <Foundation/Foundation.h>
int main(int argc, char * argv[]) {
  return 0;
}
EOF

cat > "${WORK_DIR}/BuilderApp/Info.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleIdentifier</key>
  <string>io.grpc.xcframework.builder</string>
  <key>CFBundleName</key>
  <string>BuilderApp</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
  <key>CFBundleShortVersionString</key>
  <string>1.0</string>
</dict>
</plist>
EOF

# Generate BuilderApp.xcodeproj using ruby xcodeproj gem (installed alongside CocoaPods)
ruby -e '
require "xcodeproj"
project_path = ARGV[0]
proj = Xcodeproj::Project.new(project_path)
target = proj.new_target(:application, "BuilderApp", :ios, "15.0")
group = proj.main_group.new_group("BuilderApp")
file_ref = group.new_file("BuilderApp/main.m")
target.add_file_references([file_ref])
target.build_configurations.each do |config|
  config.build_settings["INFOPLIST_FILE"] = "BuilderApp/Info.plist"
  config.build_settings["PRODUCT_BUNDLE_IDENTIFIER"] = "io.grpc.xcframework.builder"
end
proj.save
' "${WORK_DIR}/BuilderApp.xcodeproj"

# 2. Create Podfile configured for static frameworks (use_frameworks! :linkage => :static)
cat > "${WORK_DIR}/Podfile" << EOF
source 'https://cdn.cocoapods.org/'
platform :ios, '15.0'
use_frameworks! :linkage => :static

target 'BuilderApp' do
  pod 'BoringSSL-GRPC', :podspec => '${REPO_ROOT}/src/objective-c/BoringSSL-GRPC.podspec'
  pod 'gRPC-Core', :path => '${REPO_ROOT}'
  pod 'gRPC-C++', :path => '${REPO_ROOT}', :subspecs => ['Interface', 'Implementation', 'Protobuf', 'Privacy']
  pod 'gRPC-RxLibrary', :path => '${REPO_ROOT}'
  pod 'gRPC', :path => '${REPO_ROOT}', :subspecs => ['Interface', 'Interface-Legacy', 'GRPCCore', 'CFStream', 'InternalTesting', 'Privacy']
  pod 'gRPC-ProtoRPC', :path => '${REPO_ROOT}', :subspecs => ['Main', 'Legacy', 'Legacy-Header', 'CFStream']
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      config.build_settings['SKIP_INSTALL'] = 'NO'
      config.build_settings['MACH_O_TYPE'] = 'staticlib'
      config.build_settings['CLANG_CXX_LANGUAGE_STANDARD'] = 'c++17'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
      config.build_settings['GCC_GENERATE_DEBUGGING_SYMBOLS'] = 'NO'
    end
  end
end
EOF

echo "Running pod install in ${WORK_DIR}..."
pushd "${WORK_DIR}" > /dev/null
pod install --verbose
popd > /dev/null

# 3. Build all static framework targets for iphoneos (arm64) and iphonesimulator (arm64, x86_64)
TARGETS=(
  -target "BoringSSL-GRPC"
  -target "abseil"
  -target "gRPC-RxLibrary"
  -target "gRPC-Core"
  -target "gRPC-C++"
  -target "gRPC"
  -target "gRPC-ProtoRPC"
)

echo "Building static frameworks for iphoneos (arm64)..."
xcodebuild build \
  -project "${WORK_DIR}/Pods/Pods.xcodeproj" \
  "${TARGETS[@]}" \
  -configuration Release \
  -sdk iphoneos \
  ARCHS="arm64" \
  VALID_ARCHS="arm64" \
  ONLY_ACTIVE_ARCH=NO \
  BUILD_DIR="${WORK_DIR}/build/iphoneos" \
  -quiet

echo "Building static frameworks for iphonesimulator (arm64 x86_64)..."
xcodebuild build \
  -project "${WORK_DIR}/Pods/Pods.xcodeproj" \
  "${TARGETS[@]}" \
  -configuration Release \
  -sdk iphonesimulator \
  ARCHS="arm64 x86_64" \
  VALID_ARCHS="arm64 x86_64" \
  ONLY_ACTIVE_ARCH=NO \
  BUILD_DIR="${WORK_DIR}/build/iphonesimulator" \
  -quiet

# 4. Helper to normalize headers and modulemaps in each built .framework slice
prepare_framework_slice() {
  local sdk_dir="$1"
  local pod_dir="$2"
  local fw_name="$3"
  local fw_path="${sdk_dir}/${pod_dir}/${fw_name}.framework"

  if [ ! -d "${fw_path}" ]; then
    echo "ERROR: Expected framework not found at ${fw_path}"
    exit 1
  fi

  mkdir -p "${fw_path}/Headers"

  case "${fw_name}" in
    openssl_grpc)
      if [ -d "${WORK_DIR}/Pods/BoringSSL-GRPC/include/openssl" ]; then
        rsync -a "${WORK_DIR}/Pods/BoringSSL-GRPC/include/openssl/" "${fw_path}/Headers/"
      fi
      rm -rf "${fw_path}/Modules"
      ;;
    absl)
      if [ -d "${WORK_DIR}/Pods/abseil/absl" ]; then
        rsync -a --include='*/' --include='*.h' --include='*.inc' --exclude='*' \
          "${WORK_DIR}/Pods/abseil/absl/" "${fw_path}/Headers/"
      fi
      rm -rf "${fw_path}/Modules"
      ;;
    grpc)
      rsync -a "${REPO_ROOT}/include/grpc/" "${fw_path}/Headers/"
      rm -rf "${fw_path}/Modules"
      ;;
    grpcpp)
      rsync -a "${REPO_ROOT}/include/grpcpp/" "${fw_path}/Headers/"
      rm -rf "${fw_path}/Modules"
      ;;
    RxLibrary)
      rsync -a --include='*/' --include='*.h' --exclude='*' \
        "${REPO_ROOT}/src/objective-c/RxLibrary/" "${fw_path}/Headers/"
      rm -rf "${fw_path}/Headers/private"
      ;;
    GRPCClient)
      rsync -a --include='*/' --include='*.h' --exclude='*' \
        "${REPO_ROOT}/src/objective-c/GRPCClient/" "${fw_path}/Headers/"
      rm -rf "${fw_path}/Headers/private"
      ;;
    ProtoRPC)
      rsync -a --include='*/' --include='*.h' --exclude='*' \
        "${REPO_ROOT}/src/objective-c/ProtoRPC/" "${fw_path}/Headers/"
      ;;
  esac
}

IOS_OUT="${WORK_DIR}/build/iphoneos/Release-iphoneos"
SIM_OUT="${WORK_DIR}/build/iphonesimulator/Release-iphonesimulator"

for SLICE_DIR in "${IOS_OUT}" "${SIM_OUT}"; do
  prepare_framework_slice "${SLICE_DIR}" "BoringSSL-GRPC" "openssl_grpc"
  prepare_framework_slice "${SLICE_DIR}" "abseil" "absl"
  prepare_framework_slice "${SLICE_DIR}" "gRPC-Core" "grpc"
  prepare_framework_slice "${SLICE_DIR}" "gRPC-C++" "grpcpp"
  prepare_framework_slice "${SLICE_DIR}" "gRPC-RxLibrary" "RxLibrary"
  prepare_framework_slice "${SLICE_DIR}" "gRPC" "GRPCClient"
  prepare_framework_slice "${SLICE_DIR}" "gRPC-ProtoRPC" "ProtoRPC"
done

# 5. Create XCFrameworks
XCF_STAGE="${WORK_DIR}/xcframeworks"
mkdir -p "${XCF_STAGE}"

create_xcf() {
  local pod_dir="$1"
  local fw_name="$2"
  local dest_dir="$3"
  mkdir -p "${dest_dir}"
  rm -rf "${dest_dir}/${fw_name}.xcframework"

  xcodebuild -create-xcframework \
    -framework "${IOS_OUT}/${pod_dir}/${fw_name}.framework" \
    -framework "${SIM_OUT}/${pod_dir}/${fw_name}.framework" \
    -output "${dest_dir}/${fw_name}.xcframework"
}

package_pod_zip() {
  local pod_name="$1"
  local stage_dir="${XCF_STAGE}/${pod_name}"
  mkdir -p "${stage_dir}/etc" "${stage_dir}/src/objective-c"

  cp -f "${REPO_ROOT}/LICENSE" "${stage_dir}/LICENSE"
  cp -f "${REPO_ROOT}/NOTICE.txt" "${stage_dir}/NOTICE.txt"
  cp -f "${REPO_ROOT}/etc/roots.pem" "${stage_dir}/etc/roots.pem"
  cp -f "${REPO_ROOT}/src/objective-c/PrivacyInfo.xcprivacy" "${stage_dir}/src/objective-c/PrivacyInfo.xcprivacy"

  local zip_name="${pod_name}-${VERSION}-xcframework.zip"
  local zip_path="${OUTPUT_DIR}/${zip_name}"
  rm -f "${zip_path}"

  pushd "${stage_dir}" > /dev/null
  zip -qry "${zip_path}" .
  popd > /dev/null

  echo "Created ${zip_path} ($(du -h "${zip_path}" | awk '{print $1}'))"
}

echo "Creating XCFrameworks and packaging release archives..."

# 1. gRPC-Core (bundles grpc.xcframework + openssl_grpc.xcframework + absl.xcframework)
create_xcf "gRPC-Core" "grpc" "${XCF_STAGE}/gRPC-Core"
create_xcf "BoringSSL-GRPC" "openssl_grpc" "${XCF_STAGE}/gRPC-Core"
create_xcf "abseil" "absl" "${XCF_STAGE}/gRPC-Core"
package_pod_zip "gRPC-Core"

# 2. gRPC-C++ (bundles grpcpp.xcframework)
create_xcf "gRPC-C++" "grpcpp" "${XCF_STAGE}/gRPC-C++"
package_pod_zip "gRPC-C++"

# 3. gRPC-RxLibrary (bundles RxLibrary.xcframework)
create_xcf "gRPC-RxLibrary" "RxLibrary" "${XCF_STAGE}/gRPC-RxLibrary"
package_pod_zip "gRPC-RxLibrary"

# 4. gRPC (bundles GRPCClient.xcframework)
create_xcf "gRPC" "GRPCClient" "${XCF_STAGE}/gRPC"
package_pod_zip "gRPC"

# 5. gRPC-ProtoRPC (bundles ProtoRPC.xcframework)
create_xcf "gRPC-ProtoRPC" "ProtoRPC" "${XCF_STAGE}/gRPC-ProtoRPC"
package_pod_zip "gRPC-ProtoRPC"

# Clean up any changes made to repo working tree by CocoaPods prepare_command
git -C "${REPO_ROOT}" checkout -- src/core 2>/dev/null || true

echo "================================================================"
echo "Successfully built all 5 static XCFramework zip archives in:"
echo "  ${OUTPUT_DIR}"
ls -lh "${OUTPUT_DIR}"/*-xcframework.zip
echo "================================================================"
