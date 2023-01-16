// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/delegate.sol";

contract DelegateScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Delegate d = new Delegate(msg.sender);
        Delegation dn = new Delegation(address(d));

        address(dn).call(abi.encodeWithSignature("pwn()"));

        vm.stopBroadcast();
    }
}
