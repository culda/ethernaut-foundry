// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/kingForever.sol";

contract KingScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        King k = King(payable(0x48d3d4E19E8e99b37644d7cf1b90EeE5C09c0890));

        KingForever kf = new KingForever{value: k.prize() + 100 wei}(
            address(k)
        );

        vm.stopBroadcast();
    }
}
