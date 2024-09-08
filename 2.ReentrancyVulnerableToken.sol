pragma solidity ^0.8.0;

contract ReentrancyVulnerableToken {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: amount}("");  // External call
        require(success, "Transfer failed");
        balances[msg.sender] -= amount;  // State change happens after external call
    }
}
