# ogn-image

Automatically generate OGN image for Raspberry Pi (64bit OS)

This software is based on [ogn-install](https://github.com/petercreyghton/ogn-install) from Peter Creyghton
that is based on [OGN-receiver-RPI-image](https://github.com/snip/OGN-receiver-RPI-image) from Sebastién Chaumontet.
It is ported for the Github Action [pi-gen-action](https://github.com/usimd/pi-gen-action) that is a wrapper of the
official Raspberry Pi image generator [pi-gen](https://github.com/RPi-Distro/pi-gen) that generates Raspberry Pi images from scratch.

## Installation basics

- get the latest image and unzip it
- flash the image to an SD card
- edit `OGN-receiver.conf` and set the required paramaters ReceiverName, Latitude, Longitude and piUserPassword
- boot a Raspberry Pi with the flashed SD card
- log in as user pi to check the status of the receiver

## Current state

The original software installation process has two phases that contains multiple steps. The current state of the migration of these steps is:

Phase 1 (OGN software)
- [x] install prerequisites
- [ ] ~~populate the blacklist~~ (not neccessary)
- [x] compile special rtlsdr-driver
- [x] get the OGN executables
- [x] prepare executables
- [x] get WW15MGH.DAC
- [x] move configuration file to FAT32
- [x] install service
- [x] install time-sync-wait service (this step is new, but disabled. This can block the system)
- [x] additional tools (telnet, lynx) (this step is new)

Phase 2 (Additional tooling)
- [x] add a nightly reboot
- [ ] ~~set global aliases~~ (not neccessary)
- [x] configure watchdog 
- [x] disable swap 
- [x] disable fake hwclock
- [x] make the filesystem readonly (for configuration 'raspi-config' is used)
- [x] create user account for remote Admin access (disabled, because I removed the public key)
- [x] show receiver status on login
- [ ] ~~setup a reverse tunnel to remotelysecu.re~~ (remotelysecu.re is shutdown)
- [ ] enable Wifi on all platforms
- [ ] final step
- [x] debugging (this step is new)
