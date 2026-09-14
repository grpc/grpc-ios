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

pushd ${TARGET_DIR}

POD_NAME="${TARGET_FILE%.podspec}"
POD_VERSION=$(grep -E "^\s*(s\.)?version\s*=" "$TARGET_FILE" | head -n 1 | awk -F"['\"]" '{print $2}')

echo "Checking if $POD_NAME ($POD_VERSION) is already published on CocoaPods Trunk..."
if pod trunk info "$POD_NAME" | grep -q -- "- ${POD_VERSION} ("; then
    echo "SKIP: $POD_NAME ($POD_VERSION) is already published on CocoaPods Trunk. Skipping push!"
    popd
    exit 0
fi

popd

# Configure pod trunk push lint to validate on iOS only (--no-subspecs --fail-fast)
"$(dirname "$0")/skip_pod_push_lint.sh"

echo "Publishing podspec $TARGET_PODSPEC"

pushd ${TARGET_DIR}

LOG_FILE=$(mktemp)
set +e
time pod trunk push $TARGET_FILE \
    --allow-warnings \
    --use-libraries \
    --skip-tests \
    --skip-import-validation \
    --synchronous \
    --verbose 2>&1 | tee "$LOG_FILE"
PUSH_EXIT_CODE=${PIPESTATUS[0]}
set -e

if [ $PUSH_EXIT_CODE -ne 0 ]; then
    if grep -q "The spec did not pass validation" "$LOG_FILE"; then
        echo "ERROR: Podspec validation failed for $TARGET_FILE"
        rm -f "$LOG_FILE"
        exit 1
    fi

    echo "WARNING: pod trunk push exited with code $PUSH_EXIT_CODE. Checking if $POD_NAME ($POD_VERSION) was published to Trunk..."
    sleep 15
    if pod trunk info "$POD_NAME" | grep -q -- "- ${POD_VERSION} ("; then
        echo "SUCCESS: $POD_NAME ($POD_VERSION) is published on CocoaPods Trunk despite 500 response!"
        rm -f "$LOG_FILE"
        popd
        exit 0
    fi

    echo "Retrying pod trunk push for $TARGET_FILE..."
    time pod trunk push $TARGET_FILE \
        --allow-warnings \
        --use-libraries \
        --skip-tests \
        --skip-import-validation \
        --synchronous \
        --verbose
fi
rm -f "$LOG_FILE"

popd
