#!/bin/sh

USERNAME=""
PASSWORD=""
SALT=""

BASE_DIR=$(dirname $0)
printf "${USERNAME}:$(openssl passwd -apr1 -salt ${SALT} ${PASSWORD})\n" >> ${BASE_DIR}/pass