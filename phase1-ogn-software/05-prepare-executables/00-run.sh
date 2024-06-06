#!/bin/bash -e

HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

# prepare executables
# move custom files to pi home
install -v -m 0755 files/OGN-receiver-config-manager2 "${HOME_DIR}"/rtlsdr-ogn/
install -v -m 0644 files/rtlsdr-ogn "${HOME_DIR}"/rtlsdr-ogn/

sed -i "s/REMOTEADMINUSER/$RemoteAdminUser/g" "${HOME_DIR}"/rtlsdr-ogn/OGN-receiver-config-manager2

### migration ###
# configure GPU node file (became irrelevant since we dont support RPI-GPU)
