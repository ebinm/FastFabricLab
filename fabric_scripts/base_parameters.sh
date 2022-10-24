#!/usr/bin/env bash
export FABRIC_ROOT=$GOPATH
export FABRIC_CFG_PATH=${FABRIC_ROOT}/fabric_scripts #change this if you want to copy the script folder somewhere else before modifying it
export PATH=$FABRIC_ROOT/bin:$PATH

source $FABRIC_CFG_PATH/custom_parameters.sh

get_correct_address () {
    if [[ $1 != "localhost" ]]
    then
        addr=$1.$2
    else
        addr=$1
    fi

    echo ${addr}
}

get_correct_peer_address(){
    echo $(get_correct_address $1 ${PEER_DOMAIN})
}

get_correct_orderer_address(){
    echo $(get_correct_address $ORDERER_ADDRESS ${ORDERER_DOMAIN})
}

get_endorsers(){
    if [[ ${#ENDORSER_ADDRESS[@]} -eq 0 ]]; then
        endorsers=( FAST_PEER_ADDRESS )
        echo ${endorsers[@]}
    else
        echo ${ENDORSER_ADDRESS[@]}
    fi
}




export CORE_PEER_LISTENADDRESS=0.0.0.0:7051
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052
export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_CHAINCODE_BUILDER=hyperledger/fabric-ccenv:1.4

export ORDERER_GENERAL_LISTENADDRESS=0.0.0.0
export ORDERER_GENERAL_GENESISMETHOD=file
export ORDERER_GENERAL_LEDGERTYPE=ram
export ORDERER_GENERAL_GENESISFILE=${FABRIC_CFG_PATH}/channel-artifacts/genesis.block
export ORDERER_GENERAL_LOCALMSPID=OrdererMSP
