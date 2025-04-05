// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Immutable {
    address public immutable MY_ADDRESS;

    uint256 public immutable MY_UNIT;

    constructor(uint256 _myUnit){
        MY_ADDRESS = msg.sender;
        MY_UNIT = _myUnit;
    }

  
}