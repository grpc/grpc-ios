// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
import Foundation

var basePath = FileManager.default.fileExists(atPath: "native") ? "native" : "."

let package = Package(
  name: "gRPC",
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
    .package(url: "https://github.com/firebase/abseil-cpp-SwiftPM.git", "0.20230802.0"..<"0.20230803.0"),
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
      ],
      sources: [
        "src/core/",
        "third_party/re2/re2/",
        "third_party/re2/util/",
        "third_party/upb/upb/",
        "third_party/utf8_range/naive.c",
        "third_party/utf8_range/range2-neon.c",
        "third_party/utf8_range/range2-sse.c",
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
        "src/cpp/client/cronet_credentials.cc",
        "src/cpp/common/alts_util.cc",
        "src/cpp/common/alts_context.cc",
        "src/cpp/common/insecure_create_auth_context.cc",
        "src/cpp/server/admin/",
        "src/cpp/server/channelz/",
        "src/cpp/server/csds/",
        "src/cpp/server/load_reporter/",
        "src/cpp/ext/",
        "src/cpp/util/error_details.cc",
        "src/objective-c/examples/",
        "src/objective-c/manual_tests/",
        "src/objective-c/tests/",
        "src/cpp/README.md",
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
      path: basePath + "/test/spm_build"
    ),
  ],
  cLanguageStandard: .gnu11,
  cxxLanguageStandard: .cxx14
)
