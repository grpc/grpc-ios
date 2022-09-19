#!/bin/bash
set -x

## Script to delete an exsiting podspec version
## https://guides.cocoapods.org/terminal/commands.html#pod_trunk_delete
## Usage:  ./delete_pod_version.sh [POD_NAME] [VERSION]

TARGET_POD=$1
TARGET_VERSION=$2

if [ -z "$TARGET_POD" ] || [ -z "$TARGET_VERSION" ]; then
    echo "ERROR: invalid pod name or version"
    exit 1
fi

echo "deleting pod $TARGET_POD for version $TARGET_VERSION"
pod trunk delete $TARGET_POD $TARGET_VERSION || true
echo "delete done"
