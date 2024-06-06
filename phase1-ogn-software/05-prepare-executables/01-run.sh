#!/bin/bash -e

HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

# prepare executables
# move custom files to pi home
install -v -m 0755 -o 1000 -g 1000 files/OGN-receiver-config-manager2 "${HOME_DIR}"/rtlsdr-ogn/
install -v -m 0644 -o 1000 -g 1000 files/rtlsdr-ogn "${HOME_DIR}"/rtlsdr-ogn/

### migration ###
# configure GPU node file (became irrelevant since we dont support RPI-GPU)
# moved replacement of 'REMOTEADMIN' to separate workflow step
