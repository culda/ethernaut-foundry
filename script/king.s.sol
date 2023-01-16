// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/kingForever.sol";

contract KingScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        King k = (new King){value: 100 wei}();
        KingForever kf = new KingForever{value: 200 wei}(address(k));

        assert(k._king() == address(kf));

        // try to steal kingship with a higher value
        // the transfer should revert because of missing fallback/receive functions
        address(k).call{value: 1500 wei}("");

        vm.stopBroadcast();
    }
}
