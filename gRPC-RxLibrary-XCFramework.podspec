Pod::Spec.new do |s|
  s.name     = 'gRPC-RxLibrary-XCFramework'
  version = '1.84.0'
  s.version  = version
  s.summary  = 'Reactive Extensions library for iOS/OSX (Static XCFramework).'
  s.homepage = 'https://grpc.io'
  s.license  = 'Apache License, Version 2.0'
  s.authors  = { 'The gRPC contributors' => 'grpc-packages@google.com' }

  s.source = {
    :http => "https://github.com/grpc/grpc-ios/releases/download/v1.84.0/gRPC-RxLibrary-#{version}-xcframework.zip",
    :sha256 => '057f99e6b493c842d1d54f1d0ab8feb9403b262016f37cfc9b5d7fafa9945ff7'
  }

  s.cocoapods_version = '>= 1.10.0'
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.visionos.deployment_target = '1.0'

  name = 'RxLibrary'
  s.module_name = name
  s.header_dir = name

  s.xcconfig = {
    'CLANG_WARN_STRICT_PROTOTYPES' => 'NO',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'FRAMEWORK_SEARCH_PATHS' => '"$(inherited)" "$(PODS_XCFRAMEWORKS_BUILD_DIR)/gRPC-RxLibrary-XCFramework"'
  }

  s.default_subspec = 'Interface', 'Implementation'

  s.subspec 'Privacy' do |ss|
    ss.resource_bundles = {
      s.module_name => 'src/objective-c/PrivacyInfo.xcprivacy'
    }
  end

  s.subspec 'Interface' do |ss|
    ss.vendored_frameworks = 'RxLibrary.xcframework'
  end

  s.subspec 'Implementation' do |ss|
    ss.dependency "#{s.name}/Interface"
    ss.dependency "#{s.name}/Privacy"
  end
end
