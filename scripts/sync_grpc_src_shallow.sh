#!/bin/bash
set -ex

# Optional checkout revision, or default to grpc master
TARGET_REV=${1:-master}

# Prepping the folder
rm -rf tmp && mkdir tmp
rm -rf native_src && mkdir native_src

### Clone grpc and extract shallow source copy
git clone https://github.com/grpc/grpc.git tmp
pushd tmp
git checkout $TARGET_REV
REVISION=$(git rev-parse HEAD)
git submodule update --init
git-archive-all ../native_src.zip
popd

### Unload shallow copy
unzip native_src.zip
rm -rf native_src.zip && rm -rf tmp

### Record revision
echo $REVISION > native_src/REVISION.txt
