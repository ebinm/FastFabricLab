Client Setup
-------

The client works with the default chaincode (Fabcar) in [chaincode](../chaincode). It uses the Nodejs API for interacting with the FastFabric network.  
**Note:** Each step depends upon the success of the previous steps. 

1. Setup Nodejs client  
    * Run the script [client_setup.sh](../scripts/client_setup.sh) with `./scripts/client_setup.sh`.
    * Estimated time to complete: **10 seconds**.
    * What will happen ? It will..
        * create the Nodejs client with command: `ansible-playbook -i inventory/network/hosts.ini -v client_setup.yaml`.
            * install Nodejs and NPM for the Nodejs API.
            * create all necessary files for the client.


Change directory to [client](../client) with `cd client`.
All following commands for the client should be executed from this directory.

2. Add the users credentials to the wallet
    * Run the script [addToWallet.js](../client/addToWallet.js) with `node addToWallet.js`.
    * What will happen ? It will..
        * create a wallet directory with the users credentials.
    * This step is necessary to access the chaincode in the next steps.

3. Query Fabcar chaincode 
    * Inspect the file [query.js](../client/query.js)
        * In line 43 specify the query argument.
        * Use 'queryCar' and a second argument to query specific cars.
        * Use 'queryAllCars' to query all cars.
    * Run the script [query.js](../client/query.js) with `node query.js`.
    * What will happen ? It will..
        * query the chaincode with the specified arguments.

4. Invoke Fabcar chaincode 
    * Inspect the file [invoke.js](../client/invoke.js)
        * In line 43 specify the invoke argument.
        * Use 'createCar' and the specified arguments to create a new car entry.
        * Use 'changeCarOwner' and the specified arguments to change the car owner of an existing car.
    * Run the script [invoke.js](../client/invoke.js) with `node invoke.js`.
    * What will happen ? It will..
        * send an invoke transaction to the chaincode with the specified arguments.

   **Common Error:** If you did not specify a function for the network setup in [.network](../.network), 
   the first transaction might fail due to a timeout error.   
   Reason: It takes time for the endorsers to initialize the chaincode container, which might exceed the
   timeout value of the client.  
   Solution: Rerun the script [invoke.js](../client/invoke.js) with `node invoke.js`.


