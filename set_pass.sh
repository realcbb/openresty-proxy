#!/bin/sh

USERNAME=""
PASSWORD=""

BASE_DIR=$(dirname $0)
printf "${USERNAME}:$(openssl passwd -crypt ${PASSWORD})\n" >> ${BASE_DIR}/pass