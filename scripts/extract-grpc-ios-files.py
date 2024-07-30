# Copyright 2024 gRPC authors.
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

import sys
sys.path.append('tools/buildgen')

import os
import pprint
import shutil

from generate_projects import preprocess_build_files

targets = (
    'grpc++',
    'grpc',
    'grpc_authorization_provider',
    'gpr',
    'upb_base_lib',
    'upb_mem_lib',
    'upb_message_lib',
    'upb_mini_descriptor_lib',
    'upb_json_lib',
    'upb_textformat_lib',
    'upb_wire_lib',
    'utf8_range_lib',
    're2',
    'z',
)

exclude_files = (
    'src/core/ext/transport/binder/', # in grpc++ target
)

extra_files = (
    # objective c files
    'src/objective-c/GRPCClient/',
    'src/objective-c/ProtoRPC/',
    'src/objective-c/RxLibrary/',
    'src/objective-c/PrivacyInfo.xcprivacy',
    'src/objective-c/!ProtoCompiler-gRPCCppPlugin.podspec',
    'src/objective-c/!ProtoCompiler-gRPCPlugin.podspec',
    'src/objective-c/!ProtoCompiler.podspec',
    'src/objective-c/BoringSSL-GRPC.podspec',
    # cronet files
    'include/grpc/grpc_cronet.h',
    'src/core/ext/transport/cronet/client/secure/cronet_channel_create.cc',
    'src/core/ext/transport/cronet/client/secure/cronet_channel_create.h',
    'src/core/ext/transport/cronet/transport/cronet_status.cc',
    'src/core/ext/transport/cronet/transport/cronet_status.h',
    'src/core/ext/transport/cronet/transport/cronet_transport.cc',
    'src/core/ext/transport/cronet/transport/cronet_transport.h',
    'third_party/objective_c/Cronet/bidirectional_stream_c.h',
    'include/grpcpp/security/cronet_credentials.h',
    'src/cpp/client/cronet_credentials.cc',
    # podspec files
    'gRPC-C++.podspec',
    'gRPC-Core.podspec',
    'gRPC-ProtoRPC.podspec',
    'gRPC-RxLibrary.podspec',
    'gRPC.podspec',
    # module map
    'include/grpc/module.modulemap',
    # root certs
    'etc/',
    # license files
    'LICENSE',
    'NOTICE.txt',
    'third_party/re2/LICENSE',
    'third_party/utf8_range/LICENSE',
    'third_party/xxhash/LICENSE',
    'third_party/zlib/LICENSE',
    # docs
    'README.md',
)

cleanup_dirs = (
    'include',
    'src',
    'third_party',
    'etc',
)
grpc_ios_dir = '../'

def cleanup() -> None:
    for d in cleanup_dirs:
        shutil.rmtree(grpc_ios_dir+'/'+d, ignore_errors=True)

def main() -> None:
    cleanup()

    build_spec = preprocess_build_files()

    files = []
    libs = list(filter(lambda l: l.name in set(targets), build_spec.libs))

    for lib in libs:
        files.extend(lib['src'])
        files.extend(lib['headers'])
        files.extend(lib['public_headers'])
    files.extend(extra_files)

    os.makedirs(grpc_ios_dir, exist_ok=True)
    for f in files:
        if os.path.isfile(f):
            os.makedirs(grpc_ios_dir+'/'+os.path.dirname(f), exist_ok=True)
            shutil.copy2(f, grpc_ios_dir+'/'+f)
        else:
            shutil.copytree(f, grpc_ios_dir+'/'+f)
    for f in exclude_files:
        shutil.rmtree(grpc_ios_dir+'/'+f, ignore_errors=True)

if __name__ == "__main__":
    main()
