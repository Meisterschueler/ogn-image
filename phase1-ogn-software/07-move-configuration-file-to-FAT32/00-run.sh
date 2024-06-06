#!/bin/bash -e

# move configuration file to FAT32 partition in /boot for editing in any OS
install -v -m 0644 files/OGN-receiver.conf "${ROOTFS_DIR}"/boot/OGN-receiver.conf

### migration ###
# moved replacement of 'REMOTEADMIN' to separate workflow step