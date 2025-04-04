// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract SimpleStorage {
    // 定义state
    uint256 public num;

    // 发送一笔交易写入状态
    function set(uint256 _num) public {
        num = _num;
    }

    // 无法发送交易可读取状态
    function get() public view returns (uint256) {
        return num;
    }
}
