#!/bin/bash -e

# configure watchdog
echo "RuntimeWatchdogSec=10s" >> /etc/systemd/system.conf
echo "ShutdownWatchdogSec=4min" >> /etc/systemd/system.conf