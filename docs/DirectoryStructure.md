A combination of ansible, nodejs and shell scripts is used for automation of various tasks.

Directory structure is as follows:
1. **[`bin/`](../bin)**: It contains all binaries to run the FastFabric network
2. **[`caliper/`](../caliper)**: An external module called Caliper used for collecting metrics for FastFabric.
    * [`caliper/workload_modules`](../caliper/workload_modules): It contains workload modules for Caliper benchmarks.
        * [`caliper/workload_modules/fabcar`](../caliper/fabcar): It contains workload modules for chaincode Fabcar.
        * [`caliper/workload_modules/marbles`](../caliper/marbles): It contains workload modules for chaincode Marbles.
        * [`caliper/workload_modules/smallbank`](../caliper/smallbank): It contains workload modules for chaincode Smallbank.
3. **[`caliper_bench/`](../caliper_bench)**: It contains Ansible scripts to run the Caliper benchmarks.
    * [`caliper_bench/roles/create_files`](../caliper_bench/roles/create_files): Ansible role to create files for Caliper.
    * [`caliper_bench/roles/install_caliper`](../caliper_bench/roles/install_caliper): Ansible role to install Caliper.
4. **[`chaincode/`](../chaincode)**: It contains the chaincode to deploy on the FastFabric channel.
5. **[`chaincode_samples/`](../chaincode_samples)**: It contains the chaincodes Benchmark, Fabcar, Marbles and Smallbank.
6. **[`client/`](../client)**: Represents the client API with all necessary Nodejs files.
7. **[`cluster_infra/`](../cluster_infra)**: It contains Ansible scripts for setting up the cluster on OpenNebula or OpenStack.
    * [`cluster_infra/roles/install_prerequisites`](../cluster_infra/roles/install_prerequisites): Ansible role to install all prerequisites on the nodes.
    * [`cluster_infra/roles/one_instance`](../cluster_infra/roles/one_instance): Ansible role to create the cluster instances for OpenNebula.
    * [`cluster_infra/roles/os_instance`](../cluster_infra/roles/os_instance): Ansible role to create the cluster instances for OpenStack.
    * [`cluster_infra/roles/prepare_instances`](../cluster_infra/roles/prepare_instances): Ansible role to install Python via ssh to use Ansible on the remote instances.
    * [`cluster_infra/roles/share_ssh_key`](../cluster_infra/roles/share_ssh_key): Ansible role to share the ssh key with the cluster instances.
8. **[`docs/`](../docs)**: It contains all the documentation for this project.
9. **[`fabric_scripts/`](../fabric_scripts)**: It contains scripts and configuration files for the different FastFabric nodes.
10. **[`fastfabric_net`](../fastfabric_net)**: It contains Ansible scripts for setting up a FastFabric network on the cluster.
     * [`fastfabric_net/roles/chaincode_setup`](../fastfabric_net/roles/chaincode_setup): Ansible role to set up the chaincode.
     * [`fastfabric_net/roles/channel_setup`](../fastfabric_net/roles/channel_setup): Ansible role to set up the channel.
     * [`fastfabric_net/roles/client_setup`](../fastfabric_net/roles/client_setup): Ansible role to set up the client.
     * [`fastfabric_net/roles/copy_data`](../fastfabric_net/roles/copy_data): Ansible role to copy data to the FastFabric nodes.
     * [`fastfabric_net/roles/endorser`](../fastfabric_net/roles/endorser): Ansible role to set up and run the endorser node.
     * [`fastfabric_net/roles/fastpeer`](../fastfabric_net/roles/fastpeer): Ansible role to set up and run the fastpeer node.
     * [`fastfabric_net/roles/network_terminate`](../fastfabric_net/roles/network_terminate): Ansible role to terminate the FastFabric network.
     * [`fastfabric_net/roles/orderer`](../fastfabric_net/roles/orderer): Ansible role to set up and run the orderer node.
     * [`fastfabric_net/roles/prepare_cli`](../fastfabric_net/roles/prepare_cli): Ansible role to prepare the cli by creating artifacts, scripts and binaries for the nodes.
     * [`fastfabric_net/roles/storage`](../fastfabric_net/roles/storage): Ansible role to set up and run the storage node.
     * [`fastfabric_net/roles/test_chaincode`](../fastfabric_net/roles/test_chaincode): Ansible role to test the default chaincode.
11. **[`inventory/`](../inventory)**: It contains hosts and configuration for various Ansible scripts.
     * [`inventory/benchmark`](../inventory/benchmark): Ansible configuration for benchmark playbooks.
     * [`inventory/cluster`](../inventory/cluster): Ansible configuration for cluster playbooks.
     * [`inventory/infra`](../inventory/infra): Ansible configuration for infra playbooks.
     * [`inventory/network`](../inventory/network): Ansible configuration for network playbooks.
12. **[`playbooks/`](../playbooks)**: It contains Ansible playbooks to operate the system with Ansible.
13. **[`scripts/`](../scripts)**: It contains Shell scripts to automate the process of creating a cluster, setting up FastFabric and performing the benchmarks.


    