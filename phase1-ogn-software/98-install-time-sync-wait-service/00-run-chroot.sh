#!/bin/bash -e

# Enable systemd-time-wait-sync.service (needed at least for phase2 step8)
# Services with "After=time-sync.target" now get a valid time
ln -s /lib/systemd/system/systemd-time-wait-sync.service /etc/systemd/system/sysinit.target.wants/systemd-time-wait-sync.service
