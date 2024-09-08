pragma solidity ^0.8.0;

contract DoSVulnerableToken {
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000000;
    }

    function batchTransfer(address[] memory _recipients, uint256 _amount) public {
        for (uint256 i = 0; i < _recipients.length; i++) {
            require(balances[msg.sender] >= _amount);
            balances[msg.sender] -= _amount;
            balances[_recipients[i]] += _amount;
        }
    }
}
