#!/bin/bash

IMAGE_VERSION=6.1-SNAPSHOT
BASE_IMAGE_TAG=6.0-debian

#---------------------------------------------

IMAGE_NAME=cismet/cids-distribution-wrrl-db-mv

docker build \
  --build-arg IMAGE_VERSION=${IMAGE_VERSION} \
  --build-arg BASE_IMAGE_TAG=${BASE_IMAGE_TAG} \
  -t ${IMAGE_NAME}:${IMAGE_VERSION} \
  .
