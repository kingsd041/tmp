#!/bin/bash

while true
do
    if [[ `systemctl is-active k3s` = "active" ]]; then
        curl https://raw.githubusercontent.com/cnrancher/autok3s/master/assets/rancher-setup/rancher-l7.sh | sh -
        exit 0
    else
        echo "Waiting for K3S service to start ..."
        sleep 2
    fi
done