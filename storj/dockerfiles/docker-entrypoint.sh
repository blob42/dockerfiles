#!/bin/bash

set -e

STORJ_ADDRESS=1CT76j4GRhad1CXdngpzVLWjnpVLSGt7Ec
STORJ_CONFIG=/root/.config/storjshare/config.json
STORJ_LOG=/root/.config/storjshare/log
STORJ_STORAGE=/storage

if [ "$1" = 'storjshare' ];then

    storjshare-daemon start

    if [ ! -s "$STORJ_CONFIG" ];then
        storjshare create \
            --sjcx $STORJ_ADDRESS \
            -o $STORJ_CONFIG --noedit \
            --logfile $STORJ_LOG \
            --size 50GB \
            --storage $STORJ_STORAGE

    fi

    storjshare start --config $STORJ_CONFIG
    tail -f $STORJ_LOG
fi

"$@"





