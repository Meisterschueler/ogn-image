#!/bin/bash -e

# move configuration file to FAT32 partition in /boot for editing in any OS
install -v -m 0644 files/OGN-receiver.conf "${BOOTFS_DIR}"/boot/OGN-receiver.conf
sed -i "s/REMOTEADMINUSER/$RemoteAdminUser/g" "${BOOTFS_DIR}"/boot/OGN-receiver.conf
