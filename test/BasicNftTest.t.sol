//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";

contract BasicNftTest is Test {
    BasicNft public basicNft;
    DeployBasicNft public deployer = new DeployBasicNft();
    address public USER = makeAddr("USER");
    string public constant DOG_URI =
        "ipfs://bafybeicz57su3zyafexgchnfqej7zuxfa3e4xgz22yzmge6nzkhfmskqs4.ipfs.localhost:8080/?filename=st-bernard.png";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft(DOG_URI);

        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(DOG_URI)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
