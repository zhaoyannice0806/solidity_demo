// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract WETH {
    //代币名称
    string public name = "Wrapped Ether";
    //代币符号
    string public symbol = "WETH";
    // 代币精度 ETH 的精度为 18，与 Wei 单位一致
    string public decimals = "18";

    // 账户余额
    mapping(address => uint256) public balanceOf;

    // 账户对其他账户转账限制额度
    mapping(address => mapping(address => uint256)) public allowance;

    // 转账事件
    event Transfer(address indexed from, address indexed to, uint256 amount);

    // 授权事件
    event Approval(address indexed from, address indexed to, uint256 amount);

    // 存款事件
    event Disposit(address indexed to, uint256 amount);

    // 取款事件
    event Withraw(address indexed from, uint256 amount);

    // 存款
    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Disposit(msg.sender, msg.value);
    }

    // 取款
    function withrow(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withraw(msg.sender, amount);
    }

    // 授权
    function approve(address spender, uint256 amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // 查询余额
    function totalSupply() public view returns (uint256) {
        return address(this).balance;
    }

    // 直接转账
    function transfer(address to, uint256 amount) public returns (bool) {
        return transferFrom(msg.sender, to, amount);
    }

    // 授权转账
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        require(balanceOf[from] >= amount, "Insufficient balance");
        // 如果源账号不是操作者,检查配额是否足够
        if (from != msg.sender) {
            // 检查操作者（msg.sender）的授权
            require(allowance[from][msg.sender] >= amount);
            allowance[from][msg.sender] -= amount;
        }
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    receive() external payable {
        deposit();
    }

    fallback() external payable {
        deposit();
    }
}
