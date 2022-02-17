#!/bin/bash
set -ex

# preping the folder
rm -rf tmp && mkdir tmp
rm -rf native_src && mkdir native_src

### Clone grpc and extract shallow source copy
git clone https://github.com/grpc/grpc.git tmp
pushd tmp
git submodule update --init
git archive HEAD --format=zip > ../src.zip
echo $(git rev-parse HEAD) > ../native_src/REVISION.txt
popd

### Unload shallow copy
unzip src.zip -d native_src/
rm -rf src.zip && rm -rf tmp
