#!/bin/bash -ex
#
# This script builds the uvloop-0.16.0 python package after applying the
# patch in uvloop.patch. It uses a container built with the Dockerfile
# in this directory.
#

set -o pipefail

docker build --tag uvloop-build .
docker run --name uvloop-build uvloop-build
docker cp uvloop-build:/root/uvloop-0.16.0/output/uvloop-0.16.0+fortanix-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl .
docker rm uvloop-build

