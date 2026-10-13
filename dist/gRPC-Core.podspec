Pod::Spec.new do |s|
  s.name     = 'gRPC-Core'
  version = '1.84.0'
  s.version  = version
  s.summary  = 'Core cross-platform gRPC library, written in C (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "https://github.com/grpc/grpc-ios/releases/download/v1.84.0/gRPC-Core-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.visionos.deployment_target = '1.0'
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
    'FRAMEWORK_SEARCH_PATHS' => '"$(inherited)" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-Core"',
    'HEADER_SEARCH_PATHS' => '"$(inherited)" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-Core/grpc.framework/Headers" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-Core/absl.framework/Headers" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-Core/openssl_grpc.framework/Headers"'
  }

  s.default_subspecs = 'Interface', 'Implementation'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      'grpc' => 'src/objective-c/PrivacyInfo.xcprivacy',
      'openssl_grpc' => 'src/boringssl/PrivacyInfo.xcprivacy',
      'absl' => 'src/abseil/PrivacyInfo.xcprivacy'
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
