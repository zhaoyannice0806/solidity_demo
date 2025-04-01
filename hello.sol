// SPDX-License-Identifier: MIT
pragma solidity >0.8.4 <0.9.0;

contract HelloWorld {
    string public hello = "Hello World!";

    int256 public a = 0;
    uint256 public b = 2 * 256 - 1;

    // 布尔类型
    bool public flag = true;
    bool public flag2 = false;

    address public addr = 0x3474a1443A02E4891Dedd0012C62BA51588d1a20; // 16进制20位 keccack256

    bytes32 public b1 = hex"1000";

    enum Status {
        Active,
        Inactive
    }

    int256[] arr1;

    string[] arr2;

    address[] arr3;

    string public str = "hello";

    struct Person {
        uint8 age;

        bool sex;

        string name;
    }

    Person public p1 = Person(0, true, "jack");

    Person public p2 = Person({age:18,sex:false,name:"kimi"});
}
