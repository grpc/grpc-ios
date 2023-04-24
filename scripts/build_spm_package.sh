#!/bin/bash
set -ex

source ./scripts/build_commons.sh

## Build gRPC Swift release package

# build configuration and paths
SCHEME=gRPC-Package

DESTINATION="${1:-$GRPC_IOS_DESTINATION}"

# build via xcodebuild command line
time xcodebuild \
-scheme $SCHEME \
-verbose \
-destination "${DESTINATION}" \
build \
$GRPC_IOS_BUILD_FLAGS
