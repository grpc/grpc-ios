Pod::Spec.new do |s|
  s.name     = 'gRPC-ProtoRPC-XCFramework'
  version = '1.84.0'
  s.version  = version
  s.summary  = 'RPC library for Protocol Buffers, based on gRPC (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "https://github.com/grpc/grpc-ios/releases/download/v1.84.0/gRPC-ProtoRPC-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.visionos.deployment_target = '1.0'

  name = 'ProtoRPC'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"$(inherited)" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-ProtoRPC-XCFramework" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-XCFramework" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-RxLibrary-XCFramework"'
  }

  s.default_subspec = 'Main', 'Legacy', 'Legacy-Header'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Legacy-Header' do |ss|
    ss.vendored_frameworks = 'ProtoRPC.xcframework'
    ss.dependency "#{s.name}/Privacy", version
  end

  s.subspec 'Main' do |ss|
    ss.dependency "#{s.name}/Legacy-Header", version
    ss.dependency "#{s.name}/Privacy", version
    ss.dependency 'gRPC-XCFramework/Interface', version
    ss.dependency 'Protobuf', '~> 5.0'
  end

  s.subspec 'Legacy' do |ss|
    ss.dependency "#{s.name}/Main", version
    ss.dependency "#{s.name}/Legacy-Header", version
    ss.dependency 'gRPC-XCFramework/GRPCCore', version
    ss.dependency 'gRPC-RxLibrary-XCFramework', version
    ss.dependency 'Protobuf', '~> 5.0'
  end

  s.subspec 'CFStream' do |ss|
    ss.dependency "#{s.name}/Legacy", version
  end
end
