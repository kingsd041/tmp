#!/bin/bash

while true
do
    if [[ `systemctl is-active k3s` = "active" ]]; then
        curl https://github.com/cnrancher/autok3s/blob/master/assets/rancher-setup/rancher-l7.sh | sh -
        exit 0
    else
        echo "sss"
        sleep 5
    fi
done