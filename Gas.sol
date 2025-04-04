// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Gas {
    uint256 public i = 0;

    function forever() public {

        // 若交易执行过程中耗尽所有Gas（Gas Limit），则：​​
        // ​交易失败​​：状态变更（如转账、合约存储修改）会被完全回滚，仿佛交易从未发生
        // Gas不退还​​：已消耗的Gas费用由矿工收取，不会退回发送方地址
        while (true) {
            i += 1;
        }
    }
}
