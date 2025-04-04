// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract EtherUnits {
    // 以太坊中的 ​​1 ETH = 10¹⁸ wei​​ 这一单位关系，可以类比为 ​​1美元 = 100美分
    uint256 public oneWei = 1 wei;

    // 1 wei 是不是等于1
    bool public isOneWei = (oneWei == 1);

    uint256 public oneGwei = 1 gwei;
    bool public isOneGwei = (oneGwei == 1e9);

    uint256 public oneEther = 1 ether;
    bool isOneEther = (oneEther == 1e18);

    /**
     *以太坊采用 ​​10的幂次方​​ 定义单位层级（非1000进制），具体关系如下：
     *  ​​1 wei​​ = 10⁰ wei（最小不可分割单位）
     *  ​​1 gwei​​ = 10⁹ wei（Gas费用的标准单位）
     *  ​​1 ether​​ = 10¹⁸ wei（主流通单位）
     */
}
