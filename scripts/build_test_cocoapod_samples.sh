#!/bin/bash
set -ex

source ./scripts/build_commons.sh

# Build gRPC Sample App with Cocoapod Integrations
SAMPLE_ROOT=tests/cocoapod/gRPCSample
SAMPLE_WORKSPACE=$SAMPLE_ROOT/gRPCSample.xcworkspace
SCHEME=gRPCSample

# Cocoapod install
pushd $SAMPLE_ROOT
rm -Rf Pods Podfile.lock gRPCSample.xcworkspace
pod install --verbose --clean-install
popd

# Build via xcodebuild command line
time xcodebuild \
-workspace $SAMPLE_WORKSPACE \
-scheme $SCHEME \
-verbose \
-destination "${GRPC_IOS_DESTINATION}" \
build \
$GRPC_IOS_BUILD_FLAGS
