#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Setup client
ansible-playbook -i inventory/network/hosts.ini -v client_setup.yaml
set +x