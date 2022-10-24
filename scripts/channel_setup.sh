#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Setup channel
ansible-playbook -i inventory/network/hosts.ini -v channel_setup.yaml
sleep 20
set +x