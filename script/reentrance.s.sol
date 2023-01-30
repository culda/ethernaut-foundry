// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.2;

import "forge-std/Script.sol";
import "../src/reentrance.sol";

contract ReentranceScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        vm.stopBroadcast();
    }
}
