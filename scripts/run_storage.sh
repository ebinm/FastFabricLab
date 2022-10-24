#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Run storage node
ansible-playbook -i inventory/network/hosts.ini -v run_storage.yaml
set +x