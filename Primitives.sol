// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Primitives {
    // 1.Interger类型, int:有符号 uint:无符号
    //    uint(n) : 0 -> 2**n - 1
    //    int(n) : -2 ** (n - 1) -> 2 ** (n - 1) - 1

    uint8 public u8 = 12;

    int8 public i8 = -1;

    // 最大 最小int
    int256 public maxInt = type(int256).max;
    int256 public minInt = type(int256).min;

    // 2.address
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // 3.bytes
    /**
     *在Solidity中，数据类型字节表示字节序列。 Solidity提供两种字节类型： -固定大小的字节数组 -动态大小的字节数组。
     *Solidity中的术语bytes表示字节的动态数组。这是byte[]的简写。
     */
    // 1字节等于8个位
    bytes1 a = 0x11; // [10110101]
    bytes1 b = 0x56; // [01010110]

    // 默认值
    bool public boolDefVal; // false
    int256 public intDefVal; // 0
    uint256 public uintDefVal; // 0
    address public addrDefVal; // 0x0000000000000000000000000000000000000000
}
