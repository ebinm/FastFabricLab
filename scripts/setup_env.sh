#!/usr/bin/env bash

set -e
export PATH=$PATH:/home/ubuntu/.local/bin

# cd to project root
cd `dirname $0`/..

# Update the submodule code
set -x
#git submodule sync
#git submodule update --init --recursive
set +x

# Set environment variables required for Cluster setup
if [[ -f .env ]]
then
    echo "source .env"
    source .env
else
    echo "Create a .env file. Take env_sample as example"
    exit 1
fi

# Set environment variables required for Fastfabric setup
if [[ -f .network ]]
then
    echo "source .network"
    source .network
else
    echo "Create a .network file. Take network_sample as example"
    exit 1
fi


if [[ $1 = "node" ]]
then
    if [[ ! -d node_modules ]]
    then
        # Setup node environment
        set -x
        sudo apt-get remove nodejs npm
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install build-essential
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs
        npm install npm@latest-5
        sudo chown -R 1000:1000 "/home/ubuntu/.npm"
        #sudo npm install -g npm
        npm install
        npm run fabric-v1.4-deps
        set +x
    fi
else
    # Setup python environment
    if [[ -d venv ]]
    then
        echo "source venv/bin/activate"
        source venv/bin/activate
    else
        set -x
        mkdir venv
        sudo apt update
        sudo apt-get install --yes python

        curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py
        python get-pip.py
        python -m pip install --upgrade "pip < 21.0"
	#pip install pyone

        pip install virtualenv
        virtualenv --python=python3 venv
        source ./venv/bin/activate
        pip install -r requirements.txt
        #pip install certifi
        #pip install -r kubespray/requirements.txt
        set +x
    fi
fi

# Create ansible.log file if not present
if [[ ! -f ansible.log ]]
then
    touch ansible.log
fi

# Create seperate endorser addresses
for i in "${!ENDORSER_ADDRESS[@]}"; do 
  export "ENDORSER_ADDRESSES"="$ENDORSER_ADDRESSES:${ENDORSER_ADDRESS[$i]}"
done
export "ENDORSER_ADDRESSES"=${ENDORSER_ADDRESSES:1}


