#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: update-image-files.sh GIT_REF"
    exit 1
fi

ref=$1

set -e

cd $(dirname $0)/..
project_root=$(pwd)

dir=base_image_files

if [ ! -e $dir ]; then
    git clone --branch $ref git@github.com:haiwen/seafile-docker.git $dir
fi

cd $dir

git fetch
git checkout $ref

set -x
cp -pr image/* $project_root/images/base-images/

rm -rf $project_root/images/seafile/root/scripts
cp -pr scripts $project_root/images/seafile/root/

echo "Attention! I have overridden changed files, check "
find $project_root/images/seafile/root/scripts -type f -name '*.bak' | sed 's/\.bak$//'
echo "(diff them to their respective .baks) and re-apply the changes."


