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

# Run orderer
ansible-playbook -i inventory/network/hosts.ini -v run_orderer.yaml
sleep 2

# Run storage
ansible-playbook -i inventory/network/hosts.ini -v run_storage.yaml
sleep 2

# Run endorser
ansible-playbook -i inventory/network/hosts.ini -v run_endorser.yaml
sleep 2

# Run fastpeer
ansible-playbook -i inventory/network/hosts.ini -v run_fastpeer.yaml
sleep 2

# Setup channel
ansible-playbook -i inventory/network/hosts.ini -v channel_setup.yaml
sleep 20

# Setup chaincode
ansible-playbook -i inventory/network/hosts.ini -v chaincode_setup.yaml
set +x