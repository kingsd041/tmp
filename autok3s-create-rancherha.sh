#!/bin/bash

while true
do
    if [[ `systemctl is-active k3s` = "active" ]]; then
        curl https://raw.githubusercontent.com/cnrancher/autok3s/master/assets/rancher-setup/rancher-l4.sh | sh -
        exit 0
    else
        echo "sss"
        sleep 5
    fi
done