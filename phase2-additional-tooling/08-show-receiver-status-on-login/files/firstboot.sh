#!/bin/bash -e

# write the date in the version file
sed -i "s/INSTALLDATE/$(date +%F)/" /home/$FIRST_USER_NAME/rtlsdr-ogn/version 
