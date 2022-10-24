#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Setup cluster instances for fastfabric nodes
ansible-playbook -i inventory/infra/hosts.ini -v infra_setup.yaml

echo "Waiting 30 seconds for cluster instances to boot ....."
sleep 30

# Setup cluster
ansible-playbook -i inventory/cluster/hosts.ini -v cluster_setup.yaml
#set +x