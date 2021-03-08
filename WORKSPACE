workspace(name = "com_github_grpc_grpc_ios")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_google_protobuf",
    sha256 = "efaf69303e01caccc2447064fc1832dfd23c0c130df0dc5fc98a13185bb7d1a7",
    strip_prefix = "protobuf-678da4f76eb9168c9965afc2149944a66cd48546",
    urls = [
        "https://github.com/google/protobuf/archive/678da4f76eb9168c9965afc2149944a66cd48546.tar.gz",
    ],
)

http_archive(
    name = "com_github_grpc_grpc",
    sha256 = "43feda4d7ce2892400d5a0cbccecc5b1790f3253244a171360018d84c2949fb7",
    strip_prefix = "grpc-1.33.2",
    urls = [
        "https://github.com/grpc/grpc/archive/v1.33.2.zip",
    ],
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()