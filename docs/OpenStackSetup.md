Cluster Setup for OpenStack
------------

The following steps explain the setup for OpenStack. For OpenNebula use [OpenNebula](ClusterSetup.md).  
**Note:** Each step depends upon the success of the previous steps. 

1. Create an instance on the cloud platform and name it "CLI"
    * This instance will be used as the access point for the FastFabric network and as host for Ansible.
    * Create a public key in your cluster platform. In OpenStack: Compute > Access & Security > Key Pairs > "+ CREATE KEY PAIR".
    * Download the private key, we will use this later in the setup.
    * Create the CLI instance with the ssh key in OpenStack.
    * SSH into the CLI and all following commands should be executed from this instance.

2. Clone git repository
    * Change directory to the directory where you want to clone the repository e.g. `cd $HOME`.
    * Clone this git repository with `git clone https://github.com/ebinm/FastFabricLab.git`.
    * Set permission for repository with `sudo chmod -R 755 FastFabricLab`.
    * Change directory with `cd FastFabricLab`.

3. Create .env file with details about the cluster platform
    * Copy [env_sample](../env_sample) to [.env](../.env).
    * Provide appropriate details for OpenStack: "OS_USERNAME", "OS_PASSWORD", "OS_PROJECT_NAME", "OS_URL".

4. Create .network file with details about the FastFabric network
    * Copy [network_sample](../network_sample) to [.network](../.network).
    * Change the variable values to your preference.
    * There can be one orderer, storage and fastpeer but multiple endorsers.
   
   **Note:** The parameters for an invoke function can be provided to initialize the chaincode container on all endorser peers during the setup.
   This function is not mandatory, but if the function is blank, the first transaction might fail due to a timeout error.

5. Keypair setting  
    * Provide a ssh key for the creation of new instances in the FastFabric network:
        - Use the previously created key and copy it to the path specified in `.env` under `SSH_KEY` on the CLI: `scp <path to private_key> ubuntu@<cli_ip>:/home/ubuntu/.ssh/ansible-keypair`.
    * Set correct permission for the 'private key' file: `chmod 600 /home/ubuntu/.ssh/ansible-keypair`.

6. Set up cloud cluster
    * Check that all details are correct in [cli](../inventory/infra/group_vars/cli.yml) and match your OpenNebula account. 
    * Make modifications if required under `Settings for OpenStack`:
        * Instance Flavour: Ideally all instances should be size m1.medium or above.
        * Instance Security Groups: If you don't create security groups as mentioned above then change all to `default`.
    * Edit file [openstack_instance.py](cluster_infra/roles/os_instance/files/openstack_instance.py) at line 226 and add current location of openstackall.crt:
        * sess = session.Session(auth=auth, verify='[path of the repository]/openstackall.crt').
          e.g. sess = session.Session(auth=auth, verify='/home/ubuntu/FastFabricLab/openstackall.crt'.
    * Edit file [create_instances.yaml](playbooks/create_instances.yaml) at line 14 and change current role `one_instance` to `os_instance`.
    * Edit file [delete_instances.yaml](playbooks/delete_instances.yaml) at line 18 and change current role `one_instance` to `os_instance`.
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


