FROM reg.cismet.de/abstract/cids-distribution:6.1-debian

ARG IMAGE_VERSION=unknown
ARG VERSION_TAG=unknown

ENV CIDS_ACCOUNT_EXTENSION WRRLDBMV
ENV CIDS_CODEBASE http://test.wrrldbmv-jnlp.cismet.de
ENV CIDS_LOCAL_DIR ${CIDS_LIB_DIR}/local${CIDS_ACCOUNT_EXTENSION}
ENV CIDS_STARTER_DIR ${CIDS_LIB_DIR}/starter${CIDS_ACCOUNT_EXTENSION}
ENV UPDATE_SNAPSHOTS -U -Dmaven.clean.failOnError=false

# currently still dev, but will use tagged releases in the future
ENV AUTO_DISTRIBUTION_DOWNLOAD_URL_BASE=https://codeload.github.com/cismet/cids-distribution-wrrl-db-mv/tar.gz
#ENV AUTO_DISTRIBUTION_DOWNLOAD_URL_BASE=https://github.com/cismet/cids-distribution-wrrl-db-mv/archive/${VERSION_TAG}.tar.gz

RUN apt-get update && \
   apt-get install -y xvfb libxrender1 libxtst6 && \
   apt-get clean

LABEL maintainer="Jean-Michel Ruiz <jean.ruiz@cismet.de>" \
   de.cismet.cids.distribution.name="cids-distribution-wrrl-db-mv" \
   de.cismet.cids.distribution.description="cids WRRL-DB-MV Distribution Runtime Image" \
   de.cismet.cids.distribution.version="${IMAGE_VERSION}" \
   de.cismet.cids.distribution.tag.docker="${IMAGE_VERSION}" \
   de.cismet.cids.distribution.tag.git="${VERSION_TAG}"
