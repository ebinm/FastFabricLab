Caliper Benchmark Setup
------------------------

The Caliper benchmark setup works with the chaincode placed in [chaincode](../chaincode).
All data that is used or generated for the Caliper benchmarks is in directory [caliper](../caliper).
The workload modules for the benchmarks need to be placed in [caliper/workload_modules](../caliper/workload_modules).
Note: Each step depends upon the success of previous step. 

1. Set up and run benchmark
    * Run the script [benchmark_setup.sh](../scripts/benchmark_setup.sh) with `./scripts/benchmark_setup.sh [config_path]`.
        * The parameter [config_path] specifies the path to the benchmark configuration file relative to the directory [caliper](../caliper).
          E.g. `./scripts/benchmark_setup.sh config_fabcar.yaml`. If no path is specified it will use the benchmark configuration of [caliper/config](../caliper/config.yaml).
    * What will happen ? It will..
        * prepare the Caliper benchmark tool with command: `ansible-playbook -i inventory/benchmark/hosts.ini -v benchmark_prepare.yaml`.
            * install Nodejs and NPM for the Nodejs API.
            * create all necessary files for Caliper (i.g. network.yaml, connection.yaml).
            * modify all files in [caliper/workload_modules](../caliper/workload_modules) according to the current FastFabric setup.
        * run the benchmarks with command: `npx caliper launch manager --caliper-workspace ./ --caliper-networkconfig network.yaml --caliper-benchconfig [config_path]`.
        * store the metrics in [caliper](../caliper) as `report.html` file after the tests were executed

   Note: The [caliper](../caliper) directory contains sample configuration files and the according workload modules for the chaincodes Fabcar, Marbles and Smallbank. 
   When using other chaincode implementations, the benchmark configuration file must be adjusted and the workload modules provided to FastFabricLab.

   Common Error: If you did not specify a function for the network setup in [.network](../.network), 
   the first transaction might fail due to a timeout error. 

   Reason: It takes time for the endorsers to initialize the chaincode container, which might exceed the
   timeout value of caliper.

   Solution: Rerun the script [benchmark_run.sh](../scripts/benchmark_run.sh) with `./scripts/benchmark_run.sh [config_path]`.

2. Rerun benchmark
    * The benchmark can be performed immediately with the existing FastFabric network after the benchmark was performed once.
    * This script will run the benchmark without creating and modifying data before the test (-> quicker execution). 
    * Run the script [benchmark_run.sh](../scripts/benchmark_run.sh) with `./scripts/benchmark_run.sh [config_path]`.
        * The [config_path] specifies the path to the benchmark configuration file relative to the directory [caliper](../caliper).
          E.g. `./scripts/benchmark_setup.sh config_fabcar.yaml`. If no path is specified it will use the benchmark configuration of [caliper/config](../caliper/config.yaml).
    * What will happen ? It will..
        * run the benchmarks with command: `npx caliper launch manager --caliper-workspace ./ --caliper-networkconfig network.yaml --caliper-benchconfig [config_path]`.
        * store the metrics in [caliper](../caliper) as `report.html` file after the tests were executed

   Note: If the FastFabric network was changed, set up the Caliper benchmark again with the script [benchmark_setup.sh](../scripts/benchmark_setup.sh)
   according to Step 1 to apply the changes to the benchmark environment. Afterwards, the benchmarks can be rerun with [benchmark_run.sh](../scripts/benchmark_run.sh) 
   and diferent benchmark configuration files.


FastFabric-Benchmark Workflow
------------------------

1. Create FastFabric network:
    * Provide the chaincode to [fabric_scripts](../chaincode) and change the chaincode name and initialization function in [.network](../.network).
    * Specify the different parameters (e.g. block size, validator pool size) and scripts in [fabric_scripts](../fabric_scripts).
    * Run the script [fastfabric_setup.sh](../scripts/fastfabric_setup.sh) with `./scripts/fastfabric_setup.sh [-r]`.

2. Run benchmarks on current FastFabric network:
    * Provide the compatible workload modules for the current chaincode in [workload_modules](../caliper/workload_modules).
    * Specify the performance test by creating a benchmark configuration file in [caliper](../caliper).
    * Run the script [benchmark_setup.sh](../scripts/benchmark_setup.sh) with `./scripts/benchmark_setup.sh [config_path]`

3. Delete FastFabric network:
    * Run the script [fastfabric_delete.sh](../scripts/fastfabric_delete.sh) with `./scripts/fastfabric_delete.sh`

   Note: When the network and chaincode are not changed between runs, use the scripts [fastfabric_run.sh](../scripts/fastfabric_run.sh) 
   and [benchmark_run.sh](../scripts/benchmark_run.sh) for quicker execution.


