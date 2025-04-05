// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Array {
    // dynamic array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // fixed array,all elements init to 0
    uint256[10] public arr3;

    function get(uint256 index) public view returns (uint256) {
        if (index >= getLength()) {
            return 0;
        }
        return arr[index];
    }

    function push(uint256 value) public {
        arr.push(value);
    }

    function pop() public {
        if (getLength() == 0) {
            return;
        }
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        if (index >= getLength()) {
            return;
        }
        delete arr[index];
    }

    function examples() external {
        // uint256[] memory a = new uint256[](10);
    }
}
