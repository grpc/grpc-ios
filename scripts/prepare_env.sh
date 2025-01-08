#!/bin/bash

# Scripts to prepare environment for gPRC iOS repo build and test
set -ex

# Prerequisites
# Xcode command line tools and Homebrew should be already installed

# GNU command line tools
brew install coreutils

python3 -m venv .venv
source .venv/bin/activate
pip3 install pyyaml
