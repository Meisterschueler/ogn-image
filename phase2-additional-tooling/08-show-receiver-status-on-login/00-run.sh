#!/bin/bash -e

HOME="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

install -v -m 0644 files/version "${HOME}"/rtlsdr-ogn/version
sed -i "s/INSTALLDATE/$(date +%F)/" "${HOME}"/rtlsdr-ogn/version 
install -v -m 0755 files/ogn-receiver-status.sh "${ROOTFS_DIR}"/etc/profile.d/ogn-receiver-status.sh

### migration ###
# Added INSTALLDATE replacement from phase1 step1
