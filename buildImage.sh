#!/bin/bash

IMAGE_NAME=reg.cismet.de/lung/cids-distribution
IMAGE_VERSION=6.1-SNAPSHOT

# ---

IMAGE=${IMAGE_NAME}:${IMAGE_VERSION}
docker build \
  --build-arg IMAGE_VERSION=${IMAGE_VERSION} \
  -t ${IMAGE} \
  .