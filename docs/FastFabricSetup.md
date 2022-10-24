FastFabric Setup
------------

Continue the setup from in the FastFabricLab directory of the CLI.  
Note: Each step depends upon the success of the previous steps. 

1. Set up and create FastFabric network  
    * Run the script [fastfabric_setup.sh](../scripts/fastfabric_setup.sh) with `./scripts/fastfabric_setup.sh [-r]`.
        * The flag [-r] specifies whether to reset the FastFabric network and change the crypto configuration (e.g. block size) and channel artifacts. 
          E.g. `./scripts/fastfabric_setup.sh -r`. If the flag is not set, the existing FastFabric crypto-config and channel-artifacts in [fastfabric_scripts](../fastfabric_scripts) are used.
        * The script will use the chaincode file stored in [chaincode](../chaincode). As default the chaincode Fabcar is placed in
          this directory. Some other chaincode samples (Benchmark, Marbles, Smallbank) are provided in [chaincode_samples](../chaincode_samples).
    * Estimated time to complete: **5 minutes**.
    * What will happen ? It will..
        * prepare all the FastFabric nodes with the necessary dependencies, binaries and channel-artifacts with command: `ansible-playbook -i inventory/network/hosts.ini -v fastfabric_prepare.yaml`.
        * run the orderer node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_orderer.yaml`.
        * run the storage node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_storage.yaml`.
        * run the endorser nodes with command: `ansible-playbook -i inventory/network/hosts.ini -v run_endorser.yaml`.
        * run the fastpeer node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_fastpeer.yaml`.
        * set up the channel with command: `ansible-playbook -i inventory/network/hosts.ini -v channel_setup.yaml`.
        * set up the chaincode with command: `ansible-playbook -i inventory/network/hosts.ini -v chaincode_setup.yaml`.

   **Notes:** The nodes and scripts are created, so that the FastFabric network can be operated manually from the node instances after the preperation step. 
   To see the manual usage have a look at the original repository https://github.com/cgorenflo/fabric.

2. Test FastFabric network
    * Run the script [test_chaincode.sh](../scripts/test_chaincode.sh) with `./scripts/test_chaincode.sh`.
    * Estimated time to complete: **10 seconds**.
    * What will happen ? It will..
        * check, if the setup was successful for chaincode Fabcar by creating and querying some ledger entries.

    **Note:** This script only works with the default chaincode Fabcar.

3. Delete FastFabric network  
    * Run the script [fastfabric_delete.sh](../scripts/fastfabric_delete.sh) with `./scripts/fastfabric_delete.sh`.
    * Estimated time to complete: **20 seconds**.
    * What will happen ? It will..
        * terminate the FastFabric nodes with command: `ansible-playbook -i inventory/network/hosts.ini -v fastfabric_delete.yaml`.
        * not delete `crypto-config` and `channel-artifacts` on the instances.
        * not delete the cluster instances.

4. Recreate FastFabric network 
    * The network can be recreated immediatley with the existing configuration and data after the network was created once. 
    * This script will run the nodes without creating and copying data between the nodes (-> quicker setup). 
    * Run the script [fastfabric_run.sh](../scripts/fastfabric_run.sh) with `./scripts/fastfabric_run.sh`.
    * Estimated time to complete: **1 minutes**.
    * What will happen ? It will..
        * run the orderer node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_orderer.yaml`.
        * run the storage node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_storage.yaml`.
        * run the endorser nodes with command: `ansible-playbook -i inventory/network/hosts.ini -v run_endorser.yaml`.
        * run the fastpeer node with command: `ansible-playbook -i inventory/network/hosts.ini -v run_fastpeer.yaml`.
        * set up the channel with command: `ansible-playbook -i inventory/network/hosts.ini -v channel_setup.yaml`.
        * set up the chaincode with command: `ansible-playbook -i inventory/network/hosts.ini -v chaincode_setup.yaml`. 

   **Note:** If the configuration of the nodes (e.g. block size, validator pool size), the chaincode or fastfabric scripts are changed, create the network again with the script [fastfabric_setup.sh](../scripts/fastfabric_setup.sh) 
   according to Step 1 to apply the changes. Afterwards, the network can be rerun with [fastfabric_run.sh](../scripts/fastfabric_run.sh).

5. Use NodeJs Client  
    * Nodejs files for a client and the default chaincode Fabcar can be created to manually interact with the network.
    * For more details on how to use the client via the Nodejs API follow [ClientSetup](ClientSetup.md).


6. Perform benchmarks  
    * After the FastFabric Setup is successful, the benchmarks can be performed on the created network. 
    * For more details on how to run the benchmarks for FastFabric with Caliper follow [BenchmarkSetup](BenchmarkSetup.md).

