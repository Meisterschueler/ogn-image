#!/bin/bash -e

systemctl stop dphys-swapfile
systemctl disable dphys-swapfile
apt purge -y dphys-swapfile
apt autoremove -y
