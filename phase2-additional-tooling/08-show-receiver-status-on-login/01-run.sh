#!/bin/bash -e

HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

export OGNVERSION=$(head -1 "${HOME_DIR}"/rtlsdr-ogn/Changelog)

envsubst < files/version > "${HOME_DIR}"/version
chown 1000:1000 "${HOME_DIR}"/version
install -v -m 0644 files/ogn-receiver-status.sh "${ROOTFS_DIR}"/etc/profile.d/ogn-receiver-status.sh

# Install firstboot.service and firstboot.sh
install -v -m 0644 files/firstboot.service "${ROOTFS_DIR}"/lib/systemd/system/firstboot.service
envsubst < files/firstboot.sh > "${ROOTFS_DIR}"/boot/firstboot.sh
chmod +x "${ROOTFS_DIR}"/boot/firstboot.sh

### migration ###
# Enabled systemd-time-sync-wait.service in phase1 step 98
# Moved INSTALLDATE replacement from phase1 step1 to firstboot.service (https://github.com/nmcclain/raspberian-firstboot)
# Moved OGNVERSION to env variable
# used envsubst instead of sed
# Moved ~/rtlsdr-ogn/version to ~/version
