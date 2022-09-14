#!/bin/bash
set -ex

source ./scripts/build_commons.sh

## Build gRPC Sample App with Swift Package Manager and Verify Build Success

# build configuration and paths
SAMPLE_PRJ=tests/spm/gRPCSample/gRPCSample.xcodeproj
SCHEME=gRPCSample

# build via xcodebuild command line
time xcodebuild \
-project $SAMPLE_PRJ \
-scheme $SCHEME \
-verbose \
-destination "${GRPC_IOS_DESTINATION}" \
build \
$GRPC_IOS_BUILD_FLAGS
