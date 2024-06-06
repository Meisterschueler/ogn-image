#!/bin/bash -e

HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

# Get the OGN binaries
wget --no-check-certificate -qO- http://download.glidernet.org/arm64/rtlsdr-ogn-bin-arm64-latest.tgz | tar xvz -C "${HOME_DIR}"

### migration ###
# - get only the arm64 binary since RPI-GPU is not supported from bullseye on
# - do not remove binaries since we dont have multiple architectures to handle