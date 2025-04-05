// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Enum {
    enum Status {
        None, // 0
        Pending, //1
        Confirmed //2
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function none() public  {
        status = Status.None;
    }

    function reset() public  {
        // 删除会重置第一个值
        delete status;
    }
}
