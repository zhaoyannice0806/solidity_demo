// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract CrowdFounding {
    // 受益人
    address public immutable beneficiary;

    // 目标金额
    uint256 public immutable targetAmount;

    // 当前捐赠金额
    uint256 public currentDonorAmount;

    // 捐赠人=>捐赠金额
    mapping(address => uint256) public donorAmountMap;

    // 捐赠人=>是否捐赠
    mapping(address => bool) public donorIsDonatingMap;

    // 捐赠人列表
    address[] public donors;

    // 捐赠是否结束
    bool private isColosed = true;

    // 构造方法，初始化受益人 目标金额
    constructor(address beneficiary_, uint256 targetAmount_) {
        beneficiary = beneficiary_;
        targetAmount = targetAmount_;
    }

    // 捐赠方法
    function donate() external payable {
        // 检查捐赠是否结束
        require(isColosed, "Donating has ended!");

        // 1. 检查当前是否超出目标金额
        // 1.1 如果超出目标金额,计算退还金额,更新捐赠者捐赠金额,更新当前捐赠金额,将退还金额返还给捐赠者
        // 1.2 如果未超出目标金额,更新捐赠者捐赠金额,更新当前捐赠金额
        if ((currentDonorAmount + msg.value) > targetAmount) {
            uint256 potentialeDonorAmount = currentDonorAmount + msg.value;
            uint256 refundAmount = potentialeDonorAmount - targetAmount;
            donorAmountMap[msg.sender] += (msg.value - refundAmount);
            currentDonorAmount += (msg.value - refundAmount);
            payable(msg.sender).transfer(refundAmount);
        } else {
            donorAmountMap[msg.sender] += msg.value;
            currentDonorAmount += msg.value;
        }

        // 2. 记录捐赠者信息 如果未记录捐赠者信息 表示已捐赠 添加到捐赠者列表
        if (!donorIsDonatingMap[msg.sender]) {
            donors.push(msg.sender);
            donorIsDonatingMap[msg.sender] = true;
        }
    }

    // 关闭
    function clsoe() external returns (bool) {
        // 检查是否达到目标金额
        if (currentDonorAmount < targetAmount) {
            return false;
        }

        // 设置关闭状态
        isColosed = false;

        uint256 amount = currentDonorAmount;

        currentDonorAmount = 0;

        payable(beneficiary).transfer(amount);

        return true;
    }

    // 捐赠人数
    function getTotalDonors() public view returns (uint256) {
        return donors.length;
    }
}
