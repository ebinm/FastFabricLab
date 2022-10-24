#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Setup Fastfabric blockchain
ansible-playbook -i inventory/network/hosts.ini -v run_orderer.yaml
sleep 2

ansible-playbook -i inventory/network/hosts.ini -v run_storage.yaml
sleep 2

ansible-playbook -i inventory/network/hosts.ini -v run_endorser.yaml
sleep 2

ansible-playbook -i inventory/network/hosts.ini -v run_fastpeer.yaml
sleep 2

ansible-playbook -i inventory/network/hosts.ini -v channel_setup.yaml
sleep 20

ansible-playbook -i inventory/network/hosts.ini -v chaincode_setup.yaml
sleep 2
