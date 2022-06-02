#!/bin/bash
set -ex

## Build gRPC Sample App with Swift Package Manager and Verify Build Success

# build configuration and paths
SAMPLE_PRJ=tests/spm/gRPCSample/gRPCSample.xcodeproj
SCHEME=gRPCSample
DESTINATION='name=iPhone 11'

# custom build flags
BUILD_FLAGS="
  GCC_TREAT_WARNINGS_AS_ERRORS=YES
"

# build via xcodebuild command line
time xcodebuild \
-project $SAMPLE_PRJ \
-scheme $SCHEME \
-verbose \
-destination "${DESTINATION}" \
build \
$BUILD_FLAGS
