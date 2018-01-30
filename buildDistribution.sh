#!/bin/bash

IMAGE_NAME=cismet/cids-distribution-wrrl-db-mv
IMAGE_TAG=6.1-SNAPSHOT

GIT_BRANCH=dev

RELASE_TAG=dev

#----

IMAGE=${IMAGE_NAME}:${IMAGE_TAG}
CONTAINER_BUILD=build_cids-distribution-wrrl-db-mv-${IMAGE_TAG}-${RELASE_TAG}

docker run -t \
  --name ${CONTAINER_BUILD} \
  --entrypoint /entrypoint_build.sh \
  --volume $(pwd)/volume/private:/cidsDistribution/.private \
  --volume /home/jruiz/Workspace/cidsDistribution/lib/localWRRLDBMV:/cidsDistribution/lib/localWRRLDBMV \
  ${IMAGE} \
  ${GIT_BRANCH} \
&& {
#  docker diff ${CONTAINER_BUILD}
  docker commit -a "build.sh" -m "build of branch ${GIT_BRANCH}" ${CONTAINER_BUILD} ${IMAGE}-${RELASE_TAG}
  docker tag ${IMAGE}-${RELASE_TAG} ${IMAGE_NAME}
}
docker rm ${CONTAINER_BUILD}

