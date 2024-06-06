#!/bin/bash -e

(crontab -l; echo "0 42 * * * root /usr/sbin/reboot") | crontab -
