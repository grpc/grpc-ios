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
    .package(url: "https://github.com/firebase/abseil-cpp-SwiftPM.git", "0.20260526.0"..<"0.20260527.0"),
    .package(url: "https://github.com/firebase/boringssl-SwiftPM.git", "0.41.0"..<"0.42.0"),
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
        "third_party/utf8_range/utf8_range_sse.inc",
        "third_party/utf8_range/utf8_range_neon.inc",
        "third_party/re2/LICENSE",
        "third_party/utf8_range/LICENSE",
        "third_party/xxhash/LICENSE",
        "third_party/zlib/LICENSE",
        "tests",
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
        // The bundled zlib, which gRPC-Core compiles.
        .headerSearchPath("third_party/zlib"),
        .headerSearchPath("third_party/upb/"),
        .headerSearchPath("third_party/utf8_range/"),
        .headerSearchPath("third_party/xxhash/"),
        .headerSearchPath("third_party/address_sorting/include/"),
        .headerSearchPath("src/core/ext/upb-gen/"),
        .headerSearchPath("src/core/ext/upbdefs-gen/"),
        .define("GRPC_ARES", to: "0"),
        // Prefixes the bundled zlib's symbols with "z_", so they don't clash
        // with another copy of zlib in the same binary. Z_PREFIX leaves out
        // z_errmsg, which has the prefix already.
        .define("Z_PREFIX"),
        .define("z_errmsg", to: "grpc_z_errmsg"),
      ],
      linkerSettings: [
        .linkedFramework("CoreFoundation"),
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
        "include/grpcpp/ports_undef.inc",
        "include/grpcpp/ports_def.inc",
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
        .headerSearchPath("src/core/ext/upbdefs-gen/"),
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
  cxxLanguageStandard: .cxx17
)
