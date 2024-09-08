pragma solidity ^0.8.0;

contract TimestampDependentToken {
    mapping(address => uint256) public balances;
    uint256 public releaseTime;

    constructor() {
        releaseTime = block.timestamp + 1 weeks;  // Vulnerable to timestamp manipulation
    }

    function withdraw() public {
        require(block.timestamp >= releaseTime, "Tokens are still locked");
        // Token release logic here
    }
}
