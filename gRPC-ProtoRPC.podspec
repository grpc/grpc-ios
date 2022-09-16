# This file has been automatically generated from a template file.
# Please make modifications to
# `templates/gRPC-ProtoRPC.podspec.template` instead. This file can be
# regenerated from the template by running
# `tools/buildgen/generate_projects.sh`.

# Copyright 2022 gRPC authors.
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


Pod::Spec.new do |s|
    s.name     = 'gRPC-ProtoRPC'
    version    = '1.44.0-dev'
    s.version  = version
    s.summary  = 'RPC library for Protocol Buffers, based on gRPC'
    s.homepage = 'https://grpc.io'
    s.license  = 'Apache License, Version 2.0'
    s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

    s.source = {
      :git => 'https://github.com/grpc/grpc-ios.git',
    }

    objc_client_root = "native/src/objective-c/ProtoRPC"

    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '4.0'

    name = 'ProtoRPC'
    s.module_name = name
    s.header_dir = name

    s.default_subspec = 'Main', 'Legacy', 'Legacy-Header'

    s.subspec 'Legacy-Header' do |ss|
      ss.header_mappings_dir = objc_client_root
      ss.public_header_files = "#{objc_client_root}/ProtoRPCLegacy.h"
      ss.source_files = "#{objc_client_root}/ProtoRPCLegacy.h"
    end

    s.subspec 'Main' do |ss|
      ss.header_mappings_dir = objc_client_root
      ss.dependency "#{s.name}/Legacy-Header", version
      ss.dependency 'gRPC/Interface', version
      ss.dependency 'Protobuf', '~> 3.0'

      ss.source_files = "#{objc_client_root}/ProtoMethod.{h,m}",
                        "#{objc_client_root}/ProtoRPC.{h,m}",
                        "#{objc_client_root}/ProtoService.{h,m}"
    end

    s.subspec 'Legacy' do |ss|
      ss.header_mappings_dir = objc_client_root
      ss.dependency "#{s.name}/Main", version
      ss.dependency "#{s.name}/Legacy-Header", version
      ss.dependency 'gRPC/GRPCCore', version
      ss.dependency 'gRPC-RxLibrary', version
      ss.dependency 'Protobuf', '~> 3.0'

      ss.source_files = "#{objc_client_root}/ProtoRPCLegacy.m",
                        "#{objc_client_root}/ProtoServiceLegacy.m"
    end

    # CFStream is now default. Leaving this subspec only for compatibility purpose.
    s.subspec 'CFStream' do |ss|
      ss.dependency "#{s.name}/Legacy", version
    end

    s.pod_target_xcconfig = {
      # This is needed by all pods that depend on Protobuf:
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
      # This is needed by all pods that depend on gRPC-RxLibrary:
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    }
  end
