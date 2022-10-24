#!/bin/bash
source base_parameters.sh

export CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/${PEER_DOMAIN}/users/Admin@${PEER_DOMAIN}/msp

endorsers=(${FAST_PEER_ADDRESS})

if [[ ! -z ${ENDORSER_ADDRESS[@]} ]]
then
    endorsers=(${endorsers[@]} ${ENDORSER_ADDRESS[@]})
fi

for i in ${endorsers[@]}
do
    export CORE_PEER_ADDRESS=$(get_correct_peer_address ${i}):7051
    peer chaincode install -l golang -n ${CHAINCODE} -v 1.0 -o ${ORDERER_ADDRESS}:7050 -p "chaincode"
done

export CORE_PEER_ADDRESS=$(get_correct_peer_address ${endorsers[0]}):7051
echo peer chaincode instantiate -o $(get_correct_orderer_address):7050 -C ${CHANNEL} -n ${CHAINCODE} -v 1.0 -c '{\"Args\":[]}' | bash

sleep 5

if [[ -z ${ENDORSER_ADDRESS[@]} ]]
then
    endorsers=(${FAST_PEER_ADDRESS})
else
    endorsers=${ENDORSER_ADDRESS[@]}
fi

if [ -z "$FUNCTION" ]
then
      echo "\$FUNCTION is empty"
else
     
for i in ${endorsers[@]}
do
    export CORE_PEER_ADDRESS=$(get_correct_peer_address ${i}):7051

    #changes for different chaincode
    peer chaincode invoke -o $(get_correct_orderer_address):7050 -C ${CHANNEL} -n ${CHAINCODE} -c "${FUNCTION}"
done

fi

