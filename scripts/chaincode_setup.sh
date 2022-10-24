#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Setup chaincode
ansible-playbook -i inventory/network/hosts.ini -v chaincode_setup.yaml
set +x