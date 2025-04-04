// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Counter {
    int256 private counter = 0;

    // function 方法名称 (入参类型 入参名称) 可见度 状态可变性 返回类型(入参类型)
    function inc(int256 num) public {
        counter += num;
    }

    function get() public view returns (int256) {
        return counter;
    }

    function dec(int256 num) public {
        counter -= num;
    }
}
