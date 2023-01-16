// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/vault.sol";

contract VaultScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        bytes32 pwd = keccak256("password");

        Vault v = new Vault(pwd);

        v.unlock(pwd);

        vm.stopBroadcast();
    }
}
