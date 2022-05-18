#!/bin/sh 
set -x

# configure printer
/usr/bin/brsaneconfig4 -a name=$SCANNER_NAME model=$SCANNER_MODEL ip=$SCANNER_IP_ADDRESS

# generate brscan-skey config from env vars
envsubst < /opt/brother/docker_skey/config/brscan-skey.config.tmpl > /opt/brother/docker_skey/config/brscan-skey.config
ln -sfn /opt/brother/docker_skey/config/brscan-skey.config /etc/opt/brother/scanner/brscan-skey/brscan-skey.config
ln -sfn /opt/brother/docker_skey/config/brscan-skey.config /opt/brother/scanner/brscan-skey/brscan-skey.config

# start brscan-skey in foreground
/usr/bin/brscan-skey -f
