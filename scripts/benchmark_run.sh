#!/usr/bin/env bash

source `dirname $0`/setup_env.sh
CONFIG_PATH=${1:-"config.yaml"}

set -x
# Run Caliper benchmark
cd $ROOT_PATH/caliper
npx caliper launch manager --caliper-workspace ./ --caliper-networkconfig network.yaml --caliper-benchconfig "$CONFIG_PATH"
set +x