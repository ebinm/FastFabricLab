/*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

'use strict';

const { WorkloadModuleBase } = require('@hyperledger/caliper-core');

const owners = ['marble_1_1', 'marble_2_2', 'marble_3_3', 'marble_4_4'];

/**
 * Workload module for the benchmark round.
 */
class QueryWorkload extends WorkloadModuleBase {
    /**
     * Initializes the workload module instance.
     */
    constructor() {
        super();
        this.txIndex = 0;
    }

    /**
     * Assemble TXs for the round.
     * @return {Promise<TxStatus[]>}
     */
    async submitTransaction() {
        this.txIndex++;
        let marbleName = 'marble_' + this.txIndex.toString() + '_' + this.workerIndex.toString();
        const args = {
contractId: 'fabcar',
            contractVersion: 'v1',
            contractFunction: 'getMarblesByRange',
            contractArguments: [marbleName],
            timeout: 120,
            readOnly: true
        };

        await this.sutAdapter.sendRequests(args);
    }
}

/**
 * Create a new instance of the workload module.
 * @return {WorkloadModuleInterface}
 */
function createWorkloadModule() {
    return new QueryWorkload();
}

module.exports.createWorkloadModule = createWorkloadModule;
