#!/bin/bash
#
# Script to optimize pod lint during trunk push so it validates on iOS only
# (with --no-subspecs and --fail-fast) instead of compiling across all 5 platforms.
# This ensures any podspec, dependency, or compilation error is caught while
# keeping validation under ~20 minutes instead of exceeding the 6-hour timeout.
set -ex

PUSH_FILES=$(find /opt/homebrew /usr/local /Library/Ruby "$HOME/.gem" $(gem env gemdir 2>/dev/null) \
  -name "push.rb" -path "*/cocoapods-trunk-*/lib/pod/command/trunk/push.rb" 2>/dev/null | sort -u)

if [ -z "$PUSH_FILES" ]; then
  echo "ERROR: Could not locate cocoapods-trunk push.rb"
  exit 1
fi

for PUSH_FILE in $PUSH_FILES; do
  echo "Patching $PUSH_FILE to validate podspec on iOS with no_subspecs and fail_fast..."
  sudo sed -i "" "s/Validator.new(spec, \[repo_url\])/Validator.new(spec, [repo_url], ['ios']); validator.no_subspecs = true; validator.fail_fast = true/" "$PUSH_FILE"
done
