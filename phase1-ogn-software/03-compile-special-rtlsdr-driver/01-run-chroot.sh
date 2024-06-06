#!/bin/bash -e

# Get packages we need to build
apt install -y cmake debhelper dpkg-dev

# Generate rtl-sdr package with modifications for "silver dongle" v3 and v4 from rtl-sdr.com
git clone https://github.com/rtlsdrblog/rtl-sdr-blog --branch master --depth 1 --single-branch
cd rtl-sdr-blog
dpkg-buildpackage -b --no-sign
cd ..
dpkg -i librtlsdr0_*.deb
dpkg -i librtlsdr-dev_*.deb
dpkg -i rtl-sdr_*.deb

# Remove build tools and artifacts
rm -rf rtl-sdr-blog
rm *.deb *.buildinfo *.changes
apt remove -y --purge --auto-remove cmake debhelper dpkg-dev

### migration ###
# - built deb packages instead of 'make install'
# - get rid of the old libraries (became irrelevant)
# - compiler flag -DINSTALL_UDEV_RULES=ON not used (do we really need this?)
