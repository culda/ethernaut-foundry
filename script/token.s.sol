// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.2;

import "forge-std/Script.sol";
import "../src/token.sol";

contract TokenScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Token t = new Token(20 wei);
        t.transfer(0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 21);
        console.log(t.balanceOf(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));
        console.log(t.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}
