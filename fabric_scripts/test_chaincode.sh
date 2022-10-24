#!/usr/bin/env bash
source base_parameters.sh

export CORE_PEER_MSPCONFIGPATH=./crypto-config/peerOrganizations/${PEER_DOMAIN}/users/Admin@${PEER_DOMAIN}/msp

peer=$1

export CORE_PEER_ADDRESS=${FAST_PEER_ADDRESS}:7051

a="'{\"Args\":[\"initLedger\"]}'"
echo peer chaincode invoke -C ${CHANNEL}  -n ${CHAINCODE} -c $a | bash

sleep 10

a="'{\"Args\":[\"queryAllCars\"]}'"
echo peer chaincode query -C ${CHANNEL}  -n ${CHAINCODE} -c $a | bash


