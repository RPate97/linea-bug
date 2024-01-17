// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { HelloSphinx } from "../src/HelloSphinx.sol";
import { Script } from "forge-std/Script.sol";
import "@sphinx-labs/plugins/SphinxPlugin.sol";

contract HelloSphinxScript is Script, Sphinx {
    HelloSphinx helloSphinx;

    function setUp() public virtual {
        sphinxConfig.owners = [<your address>];
        sphinxConfig.orgId = "clo6byksj0001cbld6lelntej";
        sphinxConfig.threshold = 1;
        sphinxConfig.projectName = "My_Demo_Project";
        sphinxConfig.testnets = [
          Network.linea_goerli
        ];
        sphinxConfig.saltNonce = <your salt>;
    }

    function run() public sphinx {
        helloSphinx = new HelloSphinx{ salt: bytes32(uint(sphinxConfig.saltNonce)) }("Hi", 2);
        helloSphinx.add(8);
    }
}
