#!/bin/bash

# Use the global variable BUILD_ARGS if you want to
# do a build without caching.

if [ $# != 1 ]; then
    echo "Usage: build.sh IMAGE_NAME"
    exit 1
fi

name=$1

base_image_name=seafileltd/base:16.04
seafile_image_name=seafileltd/seafile:v6.2.2

set -e

cd $(dirname $0)/../images
images_directory=$(pwd)

cd $images_directory/base-images/base
docker build $BUILD_ARGS . -t $base_image_name

cd $images_directory/base-images/seafile
docker build $BUILD_ARGS . -t $seafile_image_name

cd $images_directory/seafile
docker build $BUILD_ARGS . -t $name
