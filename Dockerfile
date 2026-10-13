ARG BASE_IMAGE=ncs-toolchain:2.9.0
FROM ${BASE_IMAGE}

ARG SOURCE_REPOSITORY
LABEL org.opencontainers.image.source="${SOURCE_REPOSITORY}"

WORKDIR /opt/ncs-workspace

# Download the exact NCS v2.9.0 release
RUN west init \
      -m https://github.com/nrfconnect/sdk-nrf \
      --mr v2.9.0 \
      . \
    && west update \
    && west zephyr-export

# Display installed SDK revisions
RUN west list -f '{name}: {sha}'

WORKDIR /opt/ncs-workspace