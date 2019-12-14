#!/bin/sh

# shell folder
SHELL_FOLDER=$(cd $(dirname $0);pwd)

docker run --name=openresty -d \
    --cpus 1 \
    --ulimit nofile=32768:65536 \
    --ulimit nproc=32768:32768 \
    -v ${SHELL_FOLDER}/html:/usr/local/openresty/nginx/html:ro \
    -v ${SHELL_FOLDER}/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
    -v ${SHELL_FOLDER}/conf.d:/etc/nginx/conf.d:ro \
    -v ${SHELL_FOLDER}/pass:${SHELL_FOLDER}/pass:ro \
    -v ${SHELL_FOLDER}/proxy_auth.lua:${SHELL_FOLDER}/proxy_auth.lua:ro \
    -v /etc/letsencrypt:/etc/letsencrypt:ro \
    --net=host realcbb/openresty-proxy:1.15.8.2-alpine