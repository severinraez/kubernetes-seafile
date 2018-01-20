# Seafile on kubernetes

Based on https://github.com/haiwen/seafile-docker.

Things done differently:

* No SSL
* No support for seafile <= 6.0.6

# Building

    bin/build.sh <image-name>

# Maintenance

## Updating the base images' files

To import the image files from https://github.com/haiwen/seafile-docker, choose a tag and run

    tag=v6.2.2
    bin/update-base-image-files.sh $tag
