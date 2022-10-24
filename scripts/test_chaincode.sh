#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Test chaincode
ansible-playbook -i inventory/network/hosts.ini -v test_chaincode.yaml
set +x