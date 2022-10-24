#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Run fastpeer node
ansible-playbook -i inventory/network/hosts.ini -v run_fastpeer.yaml
set +x