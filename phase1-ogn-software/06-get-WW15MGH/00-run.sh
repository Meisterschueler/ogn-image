#!/bin/bash -e

HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

# get WW15MGH.DAC for conversion between the Height-above-Elipsoid to Height-above-Geoid thus above MSL
wget --no-check-certificate https://earth-info.nga.mil/GandG/wgs84/gravitymod/egm96/binary/WW15MGH.DAC -O "${HOME_DIR}"/WW15MGH.DAC
ln -s "${HOME_DIR}"/WW15MGH.DAC "${HOME_DIR}"/rtlsdr-ogn/WW15MGH.DAC

### migration ###
# - get the original file from internet instead of local file
# - link the file into rtlsdr-ogn instead of copy
