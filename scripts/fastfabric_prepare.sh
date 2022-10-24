#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

while getopts r flag
do
    case "${flag}" in
        r) sudo rm -f ${INVENTORY_DIR_PATH}/artifacts.ignore
           echo "FastFabric network is reset!"
           ;;
    esac
done

set -x
# Prepare Fastfabric blockchain
ansible-playbook -i inventory/network/hosts.ini -v fastfabric_prepare.yaml
set +x