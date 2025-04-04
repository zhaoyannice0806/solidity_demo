// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract IeElse {
    function foo(int256 num) public pure returns (uint8) {
        if (num < 10) {
            return 0;
        } else if (num < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(int256 num) public pure returns (uint8) {
        return num < 10 ? 0 : (num < 20 ? 1 : 2);
    }
}
