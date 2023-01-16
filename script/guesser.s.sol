// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/coinflip.sol";
import "../src/guesser.sol";

contract GuesserScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        CoinFlip c = CoinFlip(0xaB32C42ba9D79d387b5d8b86F5e312D5D87accAF);

        Guesser g1 = new Guesser(address(c));
        console.log(g1.guess());
        console.log(c.consecutiveWins());

        vm.stopBroadcast();
    }
}
