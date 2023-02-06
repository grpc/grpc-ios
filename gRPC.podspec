# This file has been automatically generated from a template file.
# Please make modifications to `templates/gRPC.podspec.template`
# instead. This file can be regenerated from the template by running
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
    s.name     = 'gRPC'
    version    = '1.50.1'
    s.version  = version
    s.summary  = 'gRPC client library for iOS/OSX'
    s.homepage = 'https://grpc.io'
    s.license  = 'Apache License, Version 2.0'
    s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

    s.source = {
      :git => 'https://github.com/grpc/grpc-ios.git',
      :tag => "v#{version}"
    }

    native_root = "native"
    objc_client_root = "#{native_root}/src/objective-c/GRPCClient"

    name = 'GRPCClient'
    s.module_name = name
    s.header_dir = name

    s.default_subspec = 'Interface', 'GRPCCore', 'Interface-Legacy'

    s.pod_target_xcconfig = {
      # This is needed by all pods that depend on gRPC-RxLibrary:
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
    }

    s.ios.deployment_target = '9.0'
    s.osx.deployment_target = '10.10'
    s.tvos.deployment_target = '10.0'
    s.watchos.deployment_target = '4.0'

    s.subspec 'Interface-Legacy' do |ss|
      ss.header_mappings_dir = objc_client_root

      ss.public_header_files = "#{objc_client_root}/GRPCCall+ChannelArg.h",
                               "#{objc_client_root}/GRPCCall+ChannelCredentials.h",
                               "#{objc_client_root}/GRPCCall+Cronet.h",
                               "#{objc_client_root}/GRPCCall+OAuth2.h",
                               "#{objc_client_root}/GRPCCall+Tests.h",
                               "#{objc_client_root}/GRPCCallLegacy.h",
                               "#{objc_client_root}/GRPCTypes.h"

      ss.source_files = "#{objc_client_root}/GRPCCall+ChannelArg.h",
                        "#{objc_client_root}/GRPCCall+ChannelCredentials.h",
                        "#{objc_client_root}/GRPCCall+Cronet.h",
                        "#{objc_client_root}/GRPCCall+OAuth2.h",
                        "#{objc_client_root}/GRPCCall+Tests.h",
                        "#{objc_client_root}/GRPCCallLegacy.h",
                        "#{objc_client_root}/GRPCTypes.h",
                        "#{objc_client_root}/GRPCTypes.m"
      ss.dependency "gRPC-RxLibrary/Interface", version

    end

    s.subspec 'Interface' do |ss|
      ss.header_mappings_dir = objc_client_root

      ss.public_header_files = "#{objc_client_root}/GRPCCall.h",
                               "#{objc_client_root}/GRPCCall+Interceptor.h",
                               "#{objc_client_root}/GRPCCallOptions.h",
                               "#{objc_client_root}/GRPCInterceptor.h",
                               "#{objc_client_root}/GRPCTransport.h",
                               "#{objc_client_root}/GRPCDispatchable.h",
                               "#{objc_client_root}/version.h"

      ss.source_files = "#{objc_client_root}/GRPCCall.h",
                        "#{objc_client_root}/GRPCCall.m",
                        "#{objc_client_root}/GRPCCall+Interceptor.h",
                        "#{objc_client_root}/GRPCCall+Interceptor.m",
                        "#{objc_client_root}/GRPCCallOptions.h",
                        "#{objc_client_root}/GRPCCallOptions.m",
                        "#{objc_client_root}/GRPCDispatchable.h",
                        "#{objc_client_root}/GRPCInterceptor.h",
                        "#{objc_client_root}/GRPCInterceptor.m",
                        "#{objc_client_root}/GRPCTransport.h",
                        "#{objc_client_root}/GRPCTransport.m",
                        "#{objc_client_root}/internal/*.h",
                        "#{objc_client_root}/private/GRPCTransport+Private.h",
                        "#{objc_client_root}/private/GRPCTransport+Private.m",
                        "#{objc_client_root}/version.h"

      ss.dependency "#{s.name}/Interface-Legacy", version
    end

    s.subspec 'GRPCCore' do |ss|
      ss.header_mappings_dir = objc_client_root

      ss.public_header_files = "#{objc_client_root}/GRPCCall+ChannelCredentials.h",
                               "#{objc_client_root}/GRPCCall+Cronet.h",
                               "#{objc_client_root}/GRPCCall+OAuth2.h",
                               "#{objc_client_root}/GRPCCall+Tests.h",
                               "#{objc_client_root}/GRPCCall+ChannelArg.h"
      ss.private_header_files = "#{objc_client_root}/private/GRPCCore/*.h"
      ss.source_files = "#{objc_client_root}/private/GRPCCore/*.{h,m}",
                        "#{objc_client_root}/GRPCCall+ChannelArg.h",
                        "#{objc_client_root}/GRPCCall+ChannelArg.m",
                        "#{objc_client_root}/GRPCCall+ChannelCredentials.h",
                        "#{objc_client_root}/GRPCCall+ChannelCredentials.m",
                        "#{objc_client_root}/GRPCCall+Cronet.h",
                        "#{objc_client_root}/GRPCCall+Cronet.m",
                        "#{objc_client_root}/GRPCCall+OAuth2.h",
                        "#{objc_client_root}/GRPCCall+OAuth2.m",
                        "#{objc_client_root}/GRPCCall+Tests.h",
                        "#{objc_client_root}/GRPCCall+Tests.m",
                        "#{objc_client_root}/GRPCCallLegacy.m"

      # Certificates, to be able to establish TLS connections:
      ss.resource_bundles = { 'gRPCCertificates' => ["#{native_root}/etc/roots.pem"] }

      ss.dependency "#{s.name}/Interface-Legacy", version
      ss.dependency "#{s.name}/Interface", version
      ss.dependency 'gRPC-Core', version
      ss.dependency 'gRPC-RxLibrary', version
    end

    # TODO(https://github.com/grpc/grpc-ios/issues/119): re-enable after adding device arch support.
    # s.subspec 'GRPCCoreCronet' do |ss|
    #   ss.header_mappings_dir = objc_client_root

    #   ss.source_files = "#{objc_client_root}/GRPCCall+Cronet.h",
    #                     "#{objc_client_root}/GRPCCall+Cronet.m",
    #                     "#{objc_client_root}/private/GRPCCore/GRPCCoreCronet/*.{h,m}"
    #   ss.dependency "#{s.name}/GRPCCore", version
    #   ss.dependency 'gRPC-Core/Cronet-Implementation', version
    #   ss.dependency 'CronetFramework'

    #   ss.ios.deployment_target = '9.0'
    # end

    # CFStream is now default. Leaving this subspec only for compatibility purpose.
    s.subspec 'CFStream' do |ss|
      ss.dependency "#{s.name}/GRPCCore", version
    end

    s.subspec 'InternalTesting' do |ss|
      ss.dependency "#{s.name}/GRPCCore", version
      ss.public_header_files = "#{objc_client_root}/internal_testing/*.h"
      ss.source_files = "#{objc_client_root}/internal_testing/*.{h,m}"
      ss.header_mappings_dir = objc_client_root
    end
  end
