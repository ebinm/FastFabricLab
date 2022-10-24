#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Terminate Fastfabric blockchain
ansible-playbook -i inventory/network/hosts.ini -v fastfabric_delete.yaml
set +x