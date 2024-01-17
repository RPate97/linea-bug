// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { HelloSphinx } from "../src/HelloSphinx.sol";
import { Script } from "forge-std/Script.sol";
import "@sphinx-labs/plugins/SphinxPlugin.sol";

contract HelloSphinxScript is Script, Sphinx {
    HelloSphinx helloSphinx;

    function setUp() public virtual {
        sphinxConfig.owners = [0xFBD0C9AA5356577F09e8cA7681A88cC8C9DF52F0];
        sphinxConfig.orgId = "clkskjg9t0000zjcb1lri0nvr";
        sphinxConfig.threshold = 1;
        sphinxConfig.projectName = "My_Demo_Project";
        sphinxConfig.testnets = [
            Network.sepolia,
            Network.optimism_sepolia,
            Network.arbitrum_sepolia,
            Network.base_sepolia,
            Network.polygon_zkevm_goerli,
            Network.fantom_testnet,
            Network.polygon_mumbai,
            Network.bnb_testnet,
            Network.avalanche_fuji,
            Network.gnosis_chiado
        ];
        sphinxConfig.saltNonce = 116242;
    }

    function run() public sphinx {
        helloSphinx = new HelloSphinx{ salt: bytes32(uint(sphinxConfig.saltNonce)) }("Hi", 2);
        helloSphinx.add(8);
    }
}
