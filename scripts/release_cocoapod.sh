#!/bin/bash
set -ex

# Release script for Cocoapod
# Usage: ./release_cocoapod.sh [PODSPEC_FILE]

TARGET_PODSPEC=$1
TARGET_DIR=$(dirname $TARGET_PODSPEC)
TARGET_FILE=$(basename $TARGET_PODSPEC)

if [ -z "$TARGET_PODSPEC" ]; then
    echo "ERROR: please specify podspec"
    exit 1
fi

# Configure pod trunk push lint to validate on iOS only (--no-subspecs --fail-fast)
"$(dirname "$0")/skip_pod_push_lint.sh"

echo "Publishing podspec $TARGET_PODSPEC"

pushd ${TARGET_DIR}
time pod trunk push $TARGET_FILE \
    --allow-warnings \
    --use-libraries \
    --skip-tests \
    --skip-import-validation \
    --synchronous \
    --verbose
popd
