ARG BASE_IMAGE_TAG=unknown
ARG IMAGE_VERSION=unknown

FROM reg.cismet.de/abstract/cids-distribution:${BASE_IMAGE_TAG}

MAINTAINER Jean-Michel Ruiz <jean.ruiz@cismet.de>

ENV CIDS_ACCOUNT_EXTENSION WRRLDBMV
ENV CIDS_CODEBASE http://test.wrrldbmv-jnlp.cismet.de
ENV CIDS_LOCAL_DIR ${CIDS_LIB_DIR}/local${CIDS_ACCOUNT_EXTENSION}
ENV CIDS_STARTER_DIR ${CIDS_LIB_DIR}/starter${CIDS_ACCOUNT_EXTENSION}
ENV UPDATE_SNAPSHOTS -U -Dmaven.clean.failOnError=false
ENV AUTO_DISTRIBUTION_DOWNLOAD_URL_BASE=https://codeload.github.com/cismet/cids-distribution-wrrl-db-mv/tar.gz

LABEL de.cismet.cids.distribution.wrrl-db-mv.name="cids-distribution-wrrl-db-mv image" \
      de.cismet.cids.distribution.wrrl-db-mv.version="${IMAGE_VERSION}" \
      de.cismet.cids.distribution.wrrl-db-mv.tag.docker="${IMAGE_VERSION}" \
      de.cismet.cids.distribution.wrrl-db-mv.tag.git="${IMAGE_VERSION}" \
      de.cismet.cids.distribution.wrrl-db-mv.description="cids WRRL-DB-MV Distribution Runtime Image"


