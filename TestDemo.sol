// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0;

contract TestDemo {
    function test1 () public pure returns (uint256 mul) {
       uint256 a = 10;
       mul = 100;
       return a;
    }

    function sum(uint[]memory arr) public pure returns (uint result) {
        for (uint i = 0; i < arr.length; ++i)  result += arr[i];
    }
}