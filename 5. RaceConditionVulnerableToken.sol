pragma solidity ^0.8.0;

contract RaceConditionVulnerableToken {
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000000;
    }

    function approve(address _spender, uint256 _value) public {
        allowance[msg.sender][_spender] = _value;
    }

    function transferFrom(address _from, address _to, uint256 _value) public {
        require(balances[_from] >= _value);
        require(allowance[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        balances[_to] += _value;
        allowance[_from][msg.sender] -= _value;
    }
}
