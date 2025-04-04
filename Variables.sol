// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Variables {
    // local 函数内声明,不在区块链中存储
    // state 函数外声明,在区块链中存储
    // global 提供有关区块链的信息

    // 声明 state 变量
    string public text = "hello";
    uint256 public num = 123;

    function doSomething()
        public
        view
        returns (
            uint256,
            uint256,
            address
        )
    {
        // 声明 local 变量
        uint256 u = 1234;
        // global
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
        return (u, timestamp, sender);
    }
}
