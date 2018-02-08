#!/bin/bash

GIT_DISTRIBUTION_RELEASE=$1

#---

IMAGE=reg.cismet.de/lung/cids-distribution:6.1-SNAPSHOT
CIDS_DISTRIBUTION=cids-distribution-wrrl-db-mv
EXTENSION=WRRLDBMV
CONTAINER_BUILD=build_${DISTRIBUTION}_${GIT_DISTRIBUTION_RELEASE}

#----

docker rm -f ${CONTAINER_BUILD} 2> /dev/null
docker run -t \
  --name ${CONTAINER_BUILD} \
  --entrypoint /entrypoint_build.sh \
  --volume $(pwd)/volume/private:/cidsDistribution/.private \
  --volume $(pwd)/volume/local:/cidsDistribution/lib/local${EXTENSION} \
  ${IMAGE} \
  ${GIT_DISTRIBUTION_RELEASE} \
&& {
  docker commit \
    -a "build.sh" \
    -m "build of branch ${GIT_DISTRIBUTION_RELEASE}" \
    ${CONTAINER_BUILD} \
    ${IMAGE} \
  && { \
    echo "####"
    if [ -z "${GIT_DISTRIBUTION_RELEASE}" ]; then
      echo "# build of ${CIDS_DISTRIBUTION} (dev branch) successful"
    else
      echo "# build of ${CIDS_DISTRIBUTION} (release: ${GIT_DISTRIBUTION_RELEASE}) successful"
    fi
    echo "# you can push it to the docker registry with:"
    echo "#    docker push ${IMAGE}"
    echo "####"
  }
}
docker rm ${CONTAINER_BUILD} > /dev/null