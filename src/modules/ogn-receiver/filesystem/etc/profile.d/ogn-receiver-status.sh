#!/bin/bash

# get parameters
source /dev/stdin < <(dos2unix < /boot/OGN-receiver.conf)
source /home/pi/version


# check internet access
INTERNETSTATUS=$(ping -c1 1.1.1.1 &>/dev/null; if [ $? -eq 0 ]; then echo "OK"; else echo "NOT CONNECTED"; fi)
# check glidernet access
OGNSTATUS=$(nc -w1 aprs.glidernet.org 14580 &>/dev/null; if [ $? -eq 0 ]; then echo "OK"; else echo "NOT REACHABLE"; fi)
# check service status
SERVICESTATUS=$(systemctl is-active rtlsdr-ogn &>/dev/null; if [ $? -eq 0 ]; then echo "OK"; else echo "NOT RUNNING (try 'sudo reboot')"; fi)
# check usb stick status
USBSTICKSTATUS=$(if [ $(lsusb|grep -ie "dvb-t" -e "rtl" -e "820" &>/dev/null; echo $?) -eq 1 ]; then echo "No USB stick detected"; else echo "OK"; fi)
# check receiver status
RECEIVERSTATUS=$(sudo netstat -tlpn|grep 50010 &>/dev/null; if [ $? -eq 0 ]; then echo "OK"; else echo "NOT CONNECTED (try 'sudo reboot')"; fi)
# check web console status
TUNNELSERVICE=$(systemctl is-active remotelysecure-client &>/dev/null; if [ $? -eq 0 ]; then echo "active"; else echo "disabled"; fi)
# check web console status
WEBCONSOLESTATUS=$(curl remotelysecu.re &>/dev/null; if [ $? -eq 0 ]; then echo "active"; else echo "unreachable"; fi)
# get bootpartition read-only
if [ $(raspi-config nonint get_bootro_now) -eq 0 ]; then
    BOOTRO="read-only"
else
    BOOTRO="read-write"
fi
# get overlay status
if [ $(raspi-config nonint get_overlay_now) -eq 0 ]; then
    OVERLAY="read-only"
else
    OVERLAY="read-write"
fi
# check RemoteAdminUser status
if [ "$(sudo chage -l $RemoteAdminUser|grep 'Account expires'|cut -d':' -f2|sed 's/ //')" == "never" ]; then REMOTEADMIN="active"; else REMOTEADMIN="disabled"; fi

# show the OGN logo
cat /usr/share/ogn-receiver-status/ogn-logo-w80.txt

# Define colors for the status page
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m'

# show receiver name or config message
if [ -z $ReceiverName ]; then
    echo "      ERROR: NO CONFIGURATION FOUND"
    echo
    echo "      Type 'sudo vi /boot/OGN-receiver.conf' and enter"
    echo "      Station, lat, lon and pi password"
    echo
else
    echo "        Station:               $ReceiverName"
    echo
    echo "        Image version:         $ImageVersion"
    echo "        RaspiOS:               $RaspiOSversion"
    echo "        OGN sw:                $OGNversion"
    echo
    echo "        Internet status:       $INTERNETSTATUS"
    echo "        Glidernet status:      $OGNSTATUS"
    echo "        rtlsdr-ogn service:    $SERVICESTATUS"
    echo "        USB stick status:      $USBSTICKSTATUS"
    echo "        Receiver status:       $RECEIVERSTATUS"
    echo
    echo "        Tunnel service:        $TUNNELSERVICE"
    echo "        Web console status     $WEBCONSOLESTATUS"
    echo "        Remote admin user:     $REMOTEADMIN"
    echo
    echo "        Boot partition:        $BOOTRO"
    echo "        File system:           $OVERLAY"
    echo
    if [ "$INTERNETSTATUS" == "OK" ]; then
      if [ "$OGNSTATUS" == "OK" ]; then
        if [ "$USBSTICKSTATUS" == "OK" ]; then
          if [ "$SERVICESTATUS" == "OK" ]; then
            if [ "$RECEIVERSTATUS" == "OK" ]; then
              if [ "$BOOTRO" == "read-only" ]; then
                if [ "$OVERLAY" == "read-only" ]; then
                    echo -e "${GREEN}        Receiver is fully operational${NC}"
                else
                  echo -e "${YELLOW}        Receiver is operational. For maximal lifespan of your SDcard enter the"
                  echo -e "        Rasberry Pi configuration with 'sudo raspi-config', go to"
                  echo -e "        '4 Performance Options' and enable the overlay filesystem.${NC}"
                fi
              else
                echo -e "${YELLOW}        Receiver is operational. For maximal lifespan of your SDcard enter the"
                echo -e "        Rasberry Pi configuration with 'sudo raspi-config', go to"
                echo -e "        '4 Performance Options', make boot partition read-only and enable the"
                echo -e "        overlay filesystem.${NC}"
              fi
            else
              echo -e "${RED}        Receiver not operational, port 50010 not active."
              echo -e "        Did you reboot after install?${NC}"
            fi
          else
            echo -e "${RED}        Service rtlsdr-ogn not started. Did you reboot after install?${NC}"
          fi
        else
          echo -e "${RED}        No USB stick detected, is the USB receiver dongle"
          echo -e "        connected and supported?${NC}"
        fi
      else
        echo -e "${RED}        aprs.glidernet.org not responding.${NC}"
      fi
    else
      echo -e "${RED}        No internet connection.${NC}"
    fi
    echo
fi

# finished