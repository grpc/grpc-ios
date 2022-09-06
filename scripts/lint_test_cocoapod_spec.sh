#!/bin/bash
set -ex

# Default to build with library with optional build using framework
BUILD_OPTION="--use-libraries"
if [[ $1 == "framework" ]]; then 
    BUILD_OPTION="--use-static-frameworks"
fi 

# gRPC ObjC Podspec
GRPC_PODSPEC=gRPC.podspec

## Verify via cocoapod lint
time pod spec lint $GRPC_PODSPEC $BUILD_OPTION \
--allow-warnings \
--platforms=ios,macos \
--skip-tests \
--verbose
