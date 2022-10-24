Shell Scripts
==============

Some shell scripts are provided to automate environment setup and provide a logical grouping of various steps.  
All shell scripts are located in the [scripts/](../scripts) directory.

The following shell scripts are available:

* [create_ssh_keypair.sh](../scripts/create_ssh_keypair.sh). This script creates a ssh keypair:
    1. Generate ssh keypair.
    2. Store ssh keypair in [ssh](../ssh).
    3. Copy key to the specified path in [.env](../.env).

* [setup_env.sh](../scripts/setup_env.sh). This script is used by all other shell scripts to set up a proper environment:
    1. Change directory to project root
    2. Export variables for Ansible
    3. If python virtual environment not present:
        * Create python3 virtual environment. 
        * Install requirements from [requiremenents.txt](../requirements.txt)
    4. Activate Python virtual environment
    5. Create `ansible.log` file if doesnt exists
        
* [cluster_setup.sh](../scripts/cluster_setup.sh). This script sets up the cluster:
    1. Create OpenNebula/OpenStack infrastructure with Ansible.
    2. Set up instances for FastFabric with Ansible.

* [cluster_delete.sh](../scripts/cluster_delete.sh). This script deletes the cluster:
    1. Delete OpenNebula/OpenStack infrastructure with Ansible.
    2. Delete data on the CLI with Ansible
    
* [fastfabric_setup.sh](../scripts/fastfabric_setup.sh): This script prepares and runs FastFabric:
    1. Prepare FastFabric network on the CLI
        * `fastfabric_setup`: use the existing crypto-config and channel-artifacts, if present.
        * `fastfabric_setup -r`: generate new crypto-config and channel-artifacts.
    2. Run orderer node on specified instance with Ansible.
    3. Run storage node on specified instance with Ansible.
    4. Run endorser nodes on specified instances with Ansible.
    5. Run fastpeer node on specified instance with Ansible.
    6. Set up channel for all nodes with Ansible
    7. Set up chaincode of directory [chaincode](../chaincode) with Ansible

* [fastfabric_prepare.sh](../scripts/fastfabric_prepare.sh): This script prepares FastFabric:
    1. Prepare FastFabric network on the CLI
        * `fastfabric_prepare`: use the existing crypto-config and channel-artifacts, if present.
        * `fastfabric_prepare -r`: generate new crypto-config and channel-artifacts.

* [fastfabric_run.sh](../scripts/fastfabric_run.sh): This script runs FastFabric:
    1. Run orderer node on specified instance with Ansible.
    2. Run storage node on specified instance with Ansible.
    3. Run endorser nodes on specified instances with Ansible.
    4. Run fastpeer node on specified instance with Ansible.
    5. Set up channel for all nodes with Ansible
    6. Set up chaincode of directory [chaincode](../chaincode) with Ansible

* [fastfabric_delete.sh](../scripts/fastfabric_delete.sh): This script deletes FastFabric:
    1. Terminate all FastFabric nodes.

* [test_chaincode.sh](../scripts/test_chaincode.sh): This script tests the chaincode Fabcar:
    1. Invoke chaincode Fabcar with Ansible.
    2. Query chaincode Fabcar with Ansible

* [client_setup.sh](../scripts/client_setup.sh): This script sets up a client for FastFabric:
    1. Set up clients Nodejs API.
    2. Create client files for chaincode Fabcar.

* [benchmark_setup.sh](../scripts/benchmark_setup.sh): This script prepares and runs the Caliper benchmark:
    1. Prepare Caliper with Ansible.
    2. Run benchmark with Caliper.
        * `benchmark_setup.sh`: use the default [config.yaml](../caliper/caliper.yaml)
        * `benchmark_setup.sh [path]`: use the config file of the specified path in [caliper](../caliper)

* [benchmark_prepare.sh](../scripts/benchmark_prepare.sh): This script prepares the Caliper benchmark:
    1. Prepare Caliper with Ansible.

* [benchmark_run.sh](../scripts/benchmark_run.sh): This script runs the Caliper benchmark:
    1. Run benchmark with Caliper.
        * `benchmark_setup.sh`: use the default [config.yaml](../caliper/caliper.yaml).
        * `benchmark_setup.sh [path]`: use the config file of the specified path in [caliper](../caliper).


There are scripts to manually set up FastFabric step by step. 
These are useful when operating directly from the instances or modifying the steps.

* [run_orderer.sh](../scripts/run_orderer.sh): This script runs the orderer node.

* [run_storage.sh](../scripts/run_storage.sh): This script runs the storage node.

* [run_endorser.sh](../scripts/run_endorser.sh): This script runs all endorser nodes.

* [run_fastpeer.sh](../scripts/run_fastpeer.sh): This script runs the fastpeer nodes.

* [channel_setup.sh](../scripts/channel_setup.sh): This script sets up the channel.

* [chaincode_setup.sh](../scripts/chaincode_setup.sh): This script sets up the chaincode.

**Note:** Using these scripts can lead to errors as they need to follow the strict process of setting up a FastFabric network.
For more information on how to use them, visit the original repository of FastFabric (https://github.com/cgorenflo/fabric).



