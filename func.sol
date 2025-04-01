// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract Func {
    string public hello = "hello";

    function sayHello(string memory name) public view returns (string memory) {
        return sayHello2(name);
    }

    function sayHello2(string memory name)
        private
        view
        returns (string memory)
    {
        return string.concat(hello, " ", name);
    }

    function cocnat2(string memory base,string memory name) public pure returns (string memory){
        return string.concat(base,name);
    }

    function setHello(string memory str) public {
        hello = str;
    }
}
