#!/bin/bash

set -ex

### Clone grpc source tree
echo "Closing grpc native repo to temp folder"
rm -rfv tmp && mkdir tmp
pushd tmp

git pull
git remote --v
git branch -a

date > generated.txt
git config user.name github-actions
git config user.email github-actions@github.com
git add .
git commit -m "generated"
git push

git request-pull origin/main $GITHUB_SERVER_URL/$GITHUB_REPOSITORY


popd
