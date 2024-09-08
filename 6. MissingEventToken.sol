pragma solidity ^0.8.0;

contract MissingEventToken {
    mapping(address => uint256) public balanceOf;

    constructor() {
        balanceOf[msg.sender] = 1000000;
    }

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        // Missing Transfer event
    }

    function approve(address _spender, uint256 _value) public {
        // Missing Approval event
    }
}
