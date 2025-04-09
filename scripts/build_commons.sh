#!/bin/bash
set -ex

# custom build flags
# TODO: re-enable warning as error after grpc native warning fix (https://github.com/grpc/grpc-ios/issues/83)
GRPC_IOS_BUILD_FLAGS="
  GCC_TREAT_WARNINGS_AS_ERRORS=NO
  CODE_SIGNING_REQUIRED=NO
  CODE_SIGNING_ALLOWED=NO
  ONLY_ACTIVE_ARCH=NO
  ARCHS=arm64
  IPHONEOS_DEPLOYMENT_TARGET=15.0
"

# Xcodebuild destination for iOS
GRPC_IOS_DESTINATION='generic/platform=iOS'
