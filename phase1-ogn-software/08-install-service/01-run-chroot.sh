#!/bin/bash -e

HOME_DIR=/home/"${FIRST_USER_NAME}"

install -v -m 0755 "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn /etc/init.d/rtlsdr-ogn
sed -i 's/Template/\/etc\/ogn/g' "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn.conf
install -v -m 0644 "${HOME_DIR}"/rtlsdr-ogn/rtlsdr-ogn.conf /etc/rtlsdr-ogn.conf
update-rc.d rtlsdr-ogn defaults
