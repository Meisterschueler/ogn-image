#!/bin/bash -e

HOME_DIR=/home/"${FIRST_USER_NAME}"

cp -v "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn /etc/init.d/rtlsdr-ogn
sed -i 's/Template/\/etc\/ogn/g' "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn.conf
cp -v "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn.conf /etc/rtlsdr-ogn.conf
update-rc.d rtlsdr-ogn defaults
