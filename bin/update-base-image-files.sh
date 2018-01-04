#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: update-image-files.sh GIT_REF"
    exit 1
fi

ref=$1

set -e

cd $(dirname $0)/..
project_root=$(pwd)

dir=$(mktemp -d)
cd $dir

git clone --branch $ref git@github.com:haiwen/seafile-docker.git
cd seafile-docker

set -x
cp -pr image $project_root/images/base-images
