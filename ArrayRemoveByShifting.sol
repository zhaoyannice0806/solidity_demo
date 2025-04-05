// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract ArrayRemoveByShifting {
    uint256[] public arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "Index out of bounds");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function set(uint256 _value) public {
        arr.push(_value);
    }

    function get() public view returns (uint256[] memory){
        return arr;
    }
}
