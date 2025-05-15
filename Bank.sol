// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Bank {
    address public immutable owner;

    event Disposit(address adr, uint256 amount);

    event WithRaw(address adr);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Disposit(msg.sender, msg.value);
    }

    function withraw() external payable {
        require(msg.sender == owner, "Not owner");
        emit WithRaw(msg.sender);
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
