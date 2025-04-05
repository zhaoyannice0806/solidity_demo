// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "./Todo.sol";

contract Todos {
    Todo[] public todos;

    function create(string calldata _txt) public {
        todos.push(Todo(_txt, false));

        todos.push(Todo({txt: _txt, complated: false}));

        Todo memory todo;
        todo.txt = _txt;
        todos.push(todo);
    }

    function get(uint256 _index) public view returns(string memory txt,bool complated) {
        Todo storage todo = todos[_index];
        return (todo.txt,todo.complated);
    }

    function updateTxt(uint256 _index,string memory _txt) public {
        Todo storage todo = todos[_index];
        todo.txt = _txt;
    }

    function toggleComplated(bool _complated) public {
        Todo storage todo = todos[0];
        
        todo.complated = !(_complated);
    }
}
