// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract NestedMapping {
    mapping(address => mapping(uint256 => bool)) public myNestedMapping;

    function set(
        address _addr,
        uint256 _key,
        bool _value
    ) public {
        myNestedMapping[_addr][_key] = _value;
    }

    function get(address _addr, uint256 _key) public view returns (bool) {
        return myNestedMapping[_addr][_key];
    }

    function remove(address _addr, uint256 _key) public {
        delete myNestedMapping[_addr][_key];
    }
}
