pragma solidity ^0.8.0;

contract InsecureOwnershipToken {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        balances[owner] = 1000000;
    }

    function mint(address _to, uint256 _amount) public {
        balances[_to] += _amount;  // No ownership or access control
    }

    function burn(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
    }
}
