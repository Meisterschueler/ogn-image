#!/bin/bash -e

# Enable firstboot.service
ln -s /lib/systemd/system/firstboot.service /etc/systemd/system/multi-user.target.wants/firstboot.service
