#!/usr/bin/env bash
#FastFabric configuration

export PEER_DOMAIN="peer"           # can be anything if running on localhost
export ORDERER_DOMAIN="orderer"        # can be anything if running on localhost

# fill in the addresses without domain suffix and without ports
export FAST_PEER_ADDRESS="fastfabric-fastpeer"
export ORDERER_ADDRESS="fastfabric-orderer"
export ENDORSER_ADDRESS=("fastfabric-endorser1" "fastfabric-endorser2")      # can define multiple addresses in the form ( "addr1" "addr2" ... ) in the future
export STORAGE_ADDRESS="fastfabric-storage"

export CHANNEL="mychannel"               # the name of the created channel of the network
export CHAINCODE="fabcar"             # the name of the chaincode used on the channel

# leave function blank if no function is available
export FUNCTION='{"function":"initLedger","Args":[]}'      # function to initialize the chaincode

#'{"function":"initLedger","Args":[]}'

#'{"function":"initMarble","Args":["testMarble", "blue", "35", "bob"]}'

#'{"function":"create_account","Args":["testAccount", "bob", "1000", "1000"]}'


