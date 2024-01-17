// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { HelloSphinx } from "../src/HelloSphinx.sol";
import { Script } from "forge-std/Script.sol";
import "@sphinx-labs/plugins/SphinxPlugin.sol";

contract HelloSphinxScript is Script, Sphinx {
    HelloSphinx helloSphinx;

    function setUp() public virtual {
        sphinxConfig.owners = [0x9fd58Bf0F2E6125Ffb0CBFa9AE91893Dbc1D5c51];
        sphinxConfig.orgId = "clo6byksj0001cbld6lelntej";
        sphinxConfig.threshold = 1;
        sphinxConfig.projectName = "My_Demo_Project";
        sphinxConfig.testnets = [
          Network.linea_goerli
            // Network.sepolia,
            // Network.optimism_sepolia,
            // Network.arbitrum_sepolia,
            // Network.base_sepolia,
            // Network.polygon_zkevm_goerli,
            // Network.fantom_testnet,
            // Network.polygon_mumbai,
            // Network.bnb_testnet,
            // Network.avalanche_fuji,
            // Network.gnosis_chiado
        ];
        sphinxConfig.saltNonce = 11724120;
    }

    function run() public sphinx {
        helloSphinx = new HelloSphinx{ salt: bytes32(uint(sphinxConfig.saltNonce)) }("Hi", 2);
        helloSphinx.add(8);
    }
}
