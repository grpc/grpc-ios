#!/bin/bash
set -ex

# Release script for Cocoapod
# Usage: ./release_cocoapod.sh [PODSPEC_FILE]

TARGET_PODSPEC=$1

if [ -z "$TARGET_PODSPEC" ]; then
    echo "ERROR: please specify podspec"
    exit 1
fi

echo "Publishing podspec $TARGET_PODSPEC"

time pod trunk push $TARGET_PODSPEC \
    --allow-warnings \
    --use-libraries \
    --skip-tests \
    --skip-import-validation \
    --synchronous \
    --verbose

