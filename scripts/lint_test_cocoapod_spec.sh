#!/bin/bash
set -ex

# Default to build with library with optional build using framework
BUILD_OPTION="--use-libraries"

# gRPC ObjC Podspecs
GRPC_PODSPECS="
    native/gRPC.podspec \
    native/gRPC-ProtoRPC.podspec \
    native/gRPC-RxLibrary.podspec
"

# Parsing arguments
# -f: use framework build
# -p: [PODSPEC_NAME] lint test the specified podspec
while getopts "hfp:" option; do
   case $option in
      f)
         echo "use frameworks"
         BUILD_OPTION="--use-static-frameworks"
         ;;
      p)
         GRPC_PODSPECS="$OPTARG"
         ;;
     \?|h)
        echo "Usage: -h for help, -f for framework build, -p to specify podspec"
        exit 1
   esac
done

echo "linting podspec '${GRPC_PODSPECS}' "

# Verify via cocoapod lint
for PODSPEC in $GRPC_PODSPECS; do
    time pod spec lint $PODSPEC $BUILD_OPTION \
    --allow-warnings \
    --skip-tests \
    --fail-fast \
    --verbose
done

