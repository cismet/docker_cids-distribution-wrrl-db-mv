#!/bin/bash

IMAGE_NAME=reg.cismet.de/lung/cids-distribution
IMAGE_TAG=6.1-SNAPSHOT

GIT_BRANCH=dev

#----

IMAGE=${IMAGE_NAME}:${IMAGE_TAG}
CONTAINER_BUILD=build_cids-distribution-wrrl-db-mv-${IMAGE_TAG}

docker rm -f ${CONTAINER_BUILD} 2> /dev/null
docker run -t \
  --name ${CONTAINER_BUILD} \
  --entrypoint /entrypoint_build.sh \
  --volume $(pwd)/volume/private:/cidsDistribution/.private \
  --volume $(pwd)/volume/local:/cidsDistribution/lib/localWRRLDBMV \
  ${IMAGE} \
  ${GIT_BRANCH} \
&& {
  docker commit -a "build.sh" -m "build of branch ${GIT_BRANCH}" ${CONTAINER_BUILD} ${IMAGE}
}
docker rm ${CONTAINER_BUILD}