// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/telephone.sol";
import "../src/telephoneOwner.sol";

contract TelephoneScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Telephone t = new Telephone();
        TelephoneOwner to = new TelephoneOwner(address(t));

        console.log("before", t.owner());
        to.own();
        console.log("after", t.owner());

        vm.stopBroadcast();
    }
}
