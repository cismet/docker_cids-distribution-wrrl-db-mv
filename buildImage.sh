#!/bin/bash

IMAGE_NAME=reg.cismet.de/lung/cids-distribution
IMAGE_VERSION=6.1-SNAPSHOT

# ---

docker build \
  --build-arg IMAGE_VERSION=${IMAGE_VERSION} \
  -t ${IMAGE_NAME}:${IMAGE_VERSION} \
  .