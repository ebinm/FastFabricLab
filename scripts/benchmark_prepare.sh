#!/usr/bin/env bash

source `dirname $0`/setup_env.sh

set -x
# Prepare Caliper benchmark
ansible-playbook -i inventory/benchmark/hosts.ini -v benchmark_prepare.yaml
set +x