#!/bin/bash
set -ex

# Default to build with library with optional build using framework
BUILD_OPTION="--use-libraries"
if [[ $1 == "framework" ]]; then
    BUILD_OPTION="--use-static-frameworks"
fi

# gRPC ObjC Podspecs
GRPC_PODSPECS="gRPC.podspec gRPC-ProtoRPC.podspec"

## Verify via cocoapod lint
##
for PODSPEC in $GRPC_PODSPECS; do
    time pod spec lint $PODSPEC $BUILD_OPTION \
    --allow-warnings \
    --skip-tests \
    --fail-fast \
    --platforms=ios,macos \
    --verbose
done

