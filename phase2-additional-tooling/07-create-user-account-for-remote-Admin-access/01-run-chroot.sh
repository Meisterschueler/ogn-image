#!/bin/bash -e

HOME_DIR=/home/"${FIRST_USER_NAME}"
ADMIN_DIR=/home/REMOTEADMINUSER

# create useraccount without password
adduser --disabled-password --gecos "" REMOTEADMINUSER
usermod -aG sudo REMOTEADMINUSER

# make sure the remote admin user can sudo without password, because there's none set
echo "REMOTEADMINUSER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ogn-admin
chmod 0440 /etc/sudoers.d/ogn-admin

# create key pair (and create ~/.ssh)
su - REMOTEADMINUSER -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"

# store a public key in ogn-admin
touch "${ADMIN_DIR}"/.ssh/authorized_keys
#cat "${HOME_DIR}"/ogn-admin.pub >> "${ADMIN_DIR}"/.ssh/authorized_keys
#rm "${HOME_DIR}"/ogn-admin.pub

# set the correct permissions and owner
chmod 600 "${ADMIN_DIR}"/.ssh/authorized_keys
chown REMOTEADMINUSER:REMOTEADMINUSER "${ADMIN_DIR}"/.ssh/authorized_keys
