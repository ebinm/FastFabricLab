

FastFabric Testbed on Cloud Cluster: Automated Deployment of a Distributed Enterprise Blockchain Network for Analysis and Testing. FastFabric is a project created by C. Gorenflo, S. Lee, L. Golab and S. Keshav.
It is a more efficient and faster version of the IBM Hyperledger Fabric. For more details, read their paper on FastFabric (https://arxiv.org/pdf/1901.00910.pdf).
This project is based on their repository (https://github.com/cgorenflo/fabric), which was used as proof of concept for their publication.  


Summary 
-------

This repository contains all necessary scripts to deploy a FastFabric network on a cluster running on cloud resources and integrate it to the Caliper benchmark testbed.
For the cluster, we assume resources are provisioned via an OpenNebula or OpenStack environment. The blockchain configuration can be individualized to the same extent as the original FastFabric repository.

**CONTRIBUTOR**: Ebin Madan (madan.ebin@gmail.com)

**CONTRIBUTOR**: Jeeta Ann Chacko


Setup 
------------

The setup of this repository contains three steps as follows:

1. [Create Infrastructure](docs/ClusterSetup.md).
2. [Create FastFabric Network](docs/FastFabricSetup.md).
3. [Run benchmarks on FastFabric](docs/BenchmarkSetup.md).

**Note**: Each step depends upon the success of the previous steps.

Details of **one-click installation scripts**: [ShellScripts](docs/ShellScripts.md).


Project Structure
--------------

A breakdown of the code structure: [DirectoryStructure](docs/DirectoryStructure.md).


Supported Versions
-------------------

- OpenNebula: 
    * XML-RPC API: ´v5.4`
    * pyone: ´>=6.4` 
- Openstack:
    * Compute API: `v2`
    * Keystone API: `v3`
    * python-openstackclient: `>=3.16`
- Hyperledger Fabric: `v1.4.0`


Technology Used
------------

1. [Ansible](https://www.ansible.com/): _"Simple, agentless IT automation that anyone can use"_
    * Used as an automation tool
    * Supported version  >=6.1
2. Shell scripts: 
    * Supported shell: Bash 
    * Used for setting up the environment and creating a one click installation. See [Documentation](docs/ShellScripts.md)
3. Python: supported version >=3.5
4. NodeJs: supported version 8.x
5. Operating system: 
Software has been tested on Ubuntu Focal LTS (20.04)

