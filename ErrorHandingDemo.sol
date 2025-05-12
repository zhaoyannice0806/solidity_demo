// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract ErrorHandingDemo {
    uint256 public balance;

    function addValue(address payable addr) public payable {
        require(msg.value % 2 == 0, "Even value required");
        uint256 befortBlance = address(this).balance;
        addr.transfer(msg.value / 2);
        assert(address(this).balance == befortBlance - msg.value / 2);
    }
}
