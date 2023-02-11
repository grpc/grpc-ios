#!/bin/bash
set -ex

source ./scripts/build_commons.sh

## Build gRPC Swift release package

# build configuration and paths
SCHEME=gRPC-Package

# build via xcodebuild command line
time xcodebuild \
-scheme $SCHEME \
-verbose \
-destination "${GRPC_IOS_DESTINATION}" \
build \
$GRPC_IOS_BUILD_FLAGS
