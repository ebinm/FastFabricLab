Cluster Setup for OpenNebula
---------------

The following steps explain the setup for OpenNebula. For OpenStack use the [OpenStackSetup](OpenStackSetup.md).  
**Note:** Each step depends upon the success of the previous steps. 

1. Create an instance on the cloud platform and name it "CLI"
    * This instance will be used as the access point for the FastFabric network and as host for Ansible.
    * Use any ssh key you want. To generate a ssh key on Linux use `ssh-keygen -t rsa -b 4096`.
    * Import the public key to your cluster platform. In OpenNebula: Settings > Update SSH Key > [Insert your publilc key] Update SSH key.
    * Create the CLI instance with the ssh key. In OpenNebula: VMs > + > [ubuntu 20.04 template] > [Use the resources as you like e.g. Memory 6 GB, Physical CPU 2, Virtual CPU 2, Disk 15 GB] > Create.
    * SSH into the CLI and all following commands should be executed from this instance.

2. Clone git repository
    * Change directory to the directory where you want to clone the repository e.g. `cd $HOME`.
    * Clone this git repository with `git clone https://github.com/ebinm/FastFabricLab.git`.
    * Set permission for repository with `sudo chmod -R 755 FastFabricLab`.
    * Change directory with `cd FastFabricLab`.

3. Create .env file with details about the cluster platform
    * Copy [env_sample](../env_sample) to [.env](../.env).
    * Provide appropriate details for OpenNebula: "ONE_USERNAME", "ONE_PASSWORD", "ONE_URL".

4. Create .network file with details about the FastFabric network
    * Copy [network_sample](../network_sample) to [.network](../.network).
    * Change the variable values to your preference.
    * There can be one orderer, storage and fastpeer but multiple endorsers.
   
   **Note:** The parameters for an invoke function can be provided to initialize the chaincode container on all endorser peers during the setup.
   This function is not mandatory, but if the function is blank, the first transaction might fail due to a timeout error.

5. Keypair setting  
    * Provide a ssh key for the creation of new instances in the FastFabric network. Choose one of the two options:
        - Use the previously created key and copy it to the path specified in `.env` under `SSH_KEY` on the CLI: `scp <path to private_key> ubuntu@<cli_ip>:/home/ubuntu/.ssh/ansible-keypair`.
        - Run the script [create_ssh_keypair.sh](../scripts/create_ssh_keypair.sh) with `./scripts/create_ssh_keypair.sh` and copy the pub key printed out and import it to your cluster platform as mentioned in Step 1.3.
    * Set correct permission for the 'private key' file: `chmod 600 /home/ubuntu/.ssh/ansible-keypair`.

   **Note:** It is recommanded to use the first option to keep the ssh key consistent in the network and not change key between CLI and FastFabric nodes.

6. Set up cloud cluster
    * Check that all details are correct in [cli.yaml](../inventory/infra/group_vars/cli.yml) and match your OpenNebula account. 
    * Make modifications if required under `Settings for OpenNebula`:
        * Instance Disk Size: Ideally all instances should have a disk size of 10 GB.
        * Instance Template: Choose a template with ubuntu-20.04.
    * Run the script [cluster_setup.sh](../scripts/cluster_setup.sh) with `./scripts/cluster_setup.sh`.
    * Estimated time to complete: **10 minutes**.
    * What will happen ? It will..
        * set up the python environment.
        * create cluster with command: `ansible-playbook -i inventory/infra/hosts.ini -v infra_setup.yaml`.
        * prepare the instances in the cluster with command: `ansible-playbook -i inventory/cluster/hosts.ini -v cluster_setup.yaml`.

   **Common Error:** Sometimes the automation process fails for some instances.   
   Reason: The installation of a prerequisite failed during the setup.  
   Solution: Rerun the script [cluster_setup.sh](../scripts/cluster_setup.sh) with `./scripts/cluster_setup.sh`.

7. Delete cloud cluster  
    * Run the script [cluster_delete.sh](../scripts/cluster_delete.sh) with `./scripts/cluster_delete.sh`.
    * Estimated time to complete: **30 seconds**.
    * What will happen ? It will..
        * delete cluster with command: `ansible-playbook -i inventory/infra/hosts.ini -v infra_delete.yaml`.

8. Create FastFabric network
    * After the Cluster Setup is successful, the FastFabric network can be set up on the created cluster. 
    * For more details on how to run the FastFabric network follow [FastFabricSetup](FastFabricSetup.md).

