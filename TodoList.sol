// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract TodoList {
    struct Todo {
        string name;
        bool isComplated;
    }

    Todo[] public todos;

    // 创建
    function create(string memory name_) external {
        todos.push(Todo({name: name_, isComplated: false}));
    }

    function modName1(uint256 index_, string memory name_) external {
        todos[index_].name = name_;
    }

    function modName2(uint256 index_, string memory name_) external {
        // ​​零拷贝​:storage 指针直接引用链上数据，无需复制到内存
        Todo storage tmp = todos[index_];
        tmp.name = name_;
    }

    /**
     * 在 Solidity 中，当函数返回 ​​引用类型（Reference Type）​​（如字符串、数组、结构体）时，必须显式指定其数据位置（memory 或 calldata)
     * 核心规则 ​引用类型必须指定数据位置​​ 包括：string、bytes、array、struct、mapping。  值类型（如 uint、bool）无需指定。
     * ​​calldata 的限制​​  calldata 仅适用于 ​​函数参数​​，不能用于返回值。
     * 返回值必须使用 memory
     *
     */
    function get1(uint256 index_)
        external
        view
        returns (string memory name_, bool isComplated_)
    {
        /**
         * 两次拷贝​
         * 第1次拷贝​​：从 storage 加载整个结构体到 memory（包括所有字段，即使未使用）
         * 第2次拷贝​​：从 memory 中将字段复制到返回值的临时内存区域
         */
        Todo memory tmp = todos[index_];
        return (tmp.name, tmp.isComplated);
    }

    function get2(uint256 index_)
        external
        view
        returns (string memory name, bool isComplated_)
    {
        /**
         * 一次拷贝​
         * 零拷贝​​：storage 指针直接引用链上数据，无需复制到内存。
         * 直接读取​​：返回值直接从 storage 加载，跳过了中间内存操作
         */
        Todo storage tmp = todos[index_];
        return (tmp.name, tmp.isComplated);
    }

    function modStatus1(uint256 index_, bool isComplated_) external {
        todos[index_].isComplated = isComplated_;
    }

      function modStatus2(uint256 index_) external {
        todos[index_].isComplated =  !todos[index_].isComplated;
    }
}
