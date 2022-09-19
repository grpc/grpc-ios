#!/bin/bash
set -ex

# Release script for Cocoapod
# Usage: ./release_cocoapod.sh [PODSPEC_FILE]

TARGET_PODSPEC=$1

if [ -z "$TARGET_PODSPEC" ]; then
    echo "ERROR: please specify podspec"
    exit 1
fi

echo "Checking current pod registration session"
pod trunk me

echo "Publishing podspec $TARGET_PODSPEC"

pod trunk push $TARGET_PODSPEC \
    --allow-warnings \
    --use-libraries \
    --skip-tests \
    --synchronous \
    --verbose

