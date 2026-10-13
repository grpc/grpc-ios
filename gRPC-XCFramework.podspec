Pod::Spec.new do |s|
  s.name     = 'gRPC-XCFramework'
  version = '1.84.0'
  s.version  = version
  s.summary  = 'gRPC client library for iOS/OSX (Static XCFramework)'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "https://github.com/grpc/grpc-ios/releases/download/v1.84.0/gRPC-#{version}-xcframework.zip"
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.visionos.deployment_target = '1.0'

  name = 'GRPCClient'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"$(inherited)" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-XCFramework" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-RxLibrary-XCFramework" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-Core-XCFramework"'
  }

  s.default_subspec = 'Interface', 'GRPCCore', 'Interface-Legacy'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Interface-Legacy' do |ss|
    ss.vendored_frameworks = 'GRPCClient.xcframework'
    ss.dependency "gRPC-RxLibrary-XCFramework/Interface", version
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
    ss.dependency 'gRPC-Core-XCFramework', version
    ss.dependency 'gRPC-RxLibrary-XCFramework', version
  end

  s.subspec 'CFStream' do |ss|
    ss.dependency "#{s.name}/GRPCCore", version
  end

  s.subspec 'InternalTesting' do |ss|
    ss.dependency "#{s.name}/GRPCCore", version
  end
end
