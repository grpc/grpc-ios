// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

var basePath = "."

let package = Package(
  name: "gRPC",
  defaultLocalization: "en",
  products: [
    .library(
      name: "gRPC-Core",
      targets: [
        "gRPC-Core",
      ]
    ),
    .library(
      name: "gRPC-cpp",
      targets: [
        "gRPC-cpp",
      ]
    )
  ],

  dependencies: [
    .package(url: "https://github.com/firebase/abseil-cpp-SwiftPM.git", "0.20240116.1"..<"0.20240117.0"),
    .package(url: "https://github.com/firebase/boringssl-SwiftPM.git", "0.32.0"..<"0.33.0"),
  ],

  targets: [
    .target(
      name: "gRPC-Core",
      dependencies: [
        .product(name:"abseil", package: "abseil-cpp-SwiftPM"),
        .product(name:"openssl_grpc", package: "boringssl-SwiftPM"),
      ],
      path: basePath,
      exclude: [
        "src/objective-c/",
        "src/cpp/",
        "third_party/upb/upb/port/def.inc",
        "third_party/upb/upb/port/undef.inc",
        "third_party/re2/LICENSE",
        "third_party/utf8_range/LICENSE",
        "third_party/xxhash/LICENSE",
        "third_party/zlib/LICENSE",
        "tests",
        "include/grpc/grpc_cronet.h",
        "src/core/ext/transport/cronet/",
        "third_party/objective_c/Cronet/bidirectional_stream_c.h",
      ],
    
      sources: [
        "src",
        "third_party",
      ],
      resources: [
        .copy("src/objective-c/PrivacyInfo.xcprivacy"),
      ],
      publicHeadersPath: "spm-core-include",
      cSettings: [
        .headerSearchPath("./"),
        .headerSearchPath("include/"),
        .headerSearchPath("third_party/re2/"),
        .headerSearchPath("third_party/upb/"),
        .headerSearchPath("third_party/utf8_range/"),
        .headerSearchPath("third_party/xxhash/"),
        .headerSearchPath("src/core/ext/upb-gen/"),
        .headerSearchPath("src/core/ext/upbdefs-gen/"),
        .define("GRPC_ARES", to: "0"),
      ],
      linkerSettings: [
        .linkedFramework("CoreFoundation"),
        .linkedLibrary("z"),
      ]
    ),
    .target(
      name: "gRPC-cpp",
      dependencies: [
        .product(name:"abseil", package: "abseil-cpp-SwiftPM"),
        "gRPC-Core",
      ],
      path: basePath,
      exclude: [
        "tests",
        "include/grpcpp/security/cronet_credentials.h",
        "src/cpp/client/cronet_credentials.cc",
      ],
      sources: [
        "src/cpp/",
      ],
      resources: [
        .copy("src/objective-c/PrivacyInfo.xcprivacy"),
      ],
      publicHeadersPath: "spm-cpp-include",
      cSettings: [
        .headerSearchPath("./"),
        .headerSearchPath("include/"),
        .headerSearchPath("third_party/upb/"),
        .headerSearchPath("src/core/ext/upb-gen"),
      ]
    ),
    .testTarget(
      name: "build-test",
      dependencies: [
        "gRPC-cpp",
      ],
      path: basePath + "/tests/spm_build"
    ),
  ],
  cLanguageStandard: .gnu11,
  cxxLanguageStandard: .cxx14
)
