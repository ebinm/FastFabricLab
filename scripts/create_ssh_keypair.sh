#!/usr/bin/env bash

# cd to project root
cd `dirname $0`/..

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

# Create directory for ssh key
mkdir -p ssh
ssh-keygen -t rsa -b 4096 -N "" -f "$ROOT_PATH/ssh/test"

echo ""
echo "Import the pub key below to your cluster platform:"
echo ""
cat $ROOT_PATH/ssh/test.pub
echo ""

# Move private key to the defined location
cp $ROOT_PATH/ssh/test $SSH_KEY
