#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Delete cluster instances
ansible-playbook -i inventory/infra/hosts.gen.ini -v infra_delete.yaml
set +x