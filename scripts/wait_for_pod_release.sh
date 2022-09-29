#!/bin/bash
set -e

# Utility script to check for a target pod version's availability in pod trunk
# Script exit without error if found
# Usage: timeout 60s ./wait_for_pod_release.sh [POD_NAME] [VERSION]

POD_NAME=$1
POD_VERSION=$2

while true
do
   echo "Checking pod availability for ${POD_NAME}, version ${POD_VERSION}"
   pod repo update --silent
   results=$(pod trunk info $POD_NAME | grep $POD_VERSION) || true
   if [[ $results == *"${POD_VERSION}"* ]]; then
    echo "Version found!"
    break
   fi
done



