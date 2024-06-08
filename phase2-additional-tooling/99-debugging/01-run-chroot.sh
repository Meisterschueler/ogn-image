HOME_DIR=/home/"${FIRST_USER_NAME}"

env > "${HOME_DIR}"/pi-gen-debug/env_01-run-chroot.sh.txt
pwd > "${HOME_DIR}"/pi-gen-debug/pwd_01-run-chroot.sh.txt
ls -lah / > "${HOME_DIR}"/pi-gen-debug/lslah_01-run-chroot.sh.txt
