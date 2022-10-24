#!/bin/bash
source custom_parameters.sh
source base_parameters.sh
echo "==== Terminating storage peer ===="
if [[ ! -z $STORAGE_ADDRESS ]]; then
    ssh -T $(get_correct_peer_address ${STORAGE_ADDRESS}) -i "/home/ubuntu/.ssh/ansible-keypair.pem" -o StrictHostKeyChecking=no '(killall peer)'
fi

echo "==== Terminating endorser ===="
for i in ${ENDORSER_ADDRESS[@]}
do
    ssh -T $(get_correct_peer_address ${i}) -i "/home/ubuntu/.ssh/ansible-keypair.pem" -o StrictHostKeyChecking=no '(killall peer)'
done

echo "==== Terminating fast peer ===="
ssh -T $(get_correct_peer_address ${FAST_PEER_ADDRESS}) -i "/home/ubuntu/.ssh/ansible-keypair.pem" -o StrictHostKeyChecking=no '(killall peer)'

echo "==== Terminating orderer ===="
ssh -T $(get_correct_orderer_address ${ORDERER_ADDRESS}) -i "/home/ubuntu/.ssh/ansible-keypair.pem" -o StrictHostKeyChecking=no '(killall orderer)'
