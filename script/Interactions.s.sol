//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployBasicNft} from "./DeployBasicNft.s.sol";
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";

contract Interactions is Script {
    string public constant DOG_URI =
        "ipfs://bafybeicz57su3zyafexgchnfqej7zuxfa3e4xgz22yzmge6nzkhfmskqs4.ipfs.localhost:8080/?filename=st-bernard.png";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("DeployBasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(DOG_URI);
        vm.stopBroadcast();
    }

    function MintMoodNft() public {}
}
