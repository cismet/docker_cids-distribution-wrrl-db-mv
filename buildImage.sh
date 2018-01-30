#!/bin/bash

IMAGE_VERSION=6.1-SNAPSHOT

BASE_IMAGE_TAG=6.1-debian
IMAGE_NAME=reg.cismet.de/lung/cids-distribution

docker build \
  --build-arg IMAGE_VERSION=${IMAGE_VERSION} \
  --build-arg BASE_IMAGE_TAG=${BASE_IMAGE_TAG} \
  -t ${IMAGE_NAME}:${IMAGE_VERSION} \
  .
