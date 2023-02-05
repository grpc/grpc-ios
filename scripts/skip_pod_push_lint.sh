#!/bin/bash
#
# Script to disable pod lint during trunk push.
#
# The script provides an ad-hoc patch to the internal cocoapod push command by removing the
# validation / lint steps. The script should be relatively stable for runners with a fixed virtual
# mac os x image, but may require updates to the Gem/Trunk versioning if upgrading to a new runner
set -ex

# env setup
GEM_VERSION=3.0.0
POD_TRUNK_VERSION=1.6.0

# PUSH_FILE_DIR="/Library/Ruby/Gems/2.6.0/gems/cocoapods-trunk-1.6.0/lib/pod/command/trunk"
PUSH_FILE_DIR="/usr/local/lib/ruby/gems/${GEM_VERSION}/gems/cocoapods-trunk-${POD_TRUNK_VERSION}/lib/pod/command/trunk"

# remove validation steps
pushd $PUSH_FILE_DIR
sudo sed -i "" 's/^ *validate_podspec//' push.rb
popd
