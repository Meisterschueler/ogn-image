HOME_DIR="${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"

mkdir "${HOME_DIR}"/pi-gen-debug

env > "${HOME_DIR}"/pi-gen-debug/env_00-run.sh.txt
pwd > "${HOME_DIR}"/pi-gen-debug/pwd_00-run.sh.txt
ls -lah / > "${HOME_DIR}"/pi-gen-debug/lslah_00-run.sh.txt
