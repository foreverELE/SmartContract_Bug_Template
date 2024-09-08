pragma solidity ^0.8.0;

contract SelfDestructToken {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        balances[owner] = 1000000;
    }

    function selfDestruct() public {
        require(msg.sender == owner, "Only owner can destroy the contract");
        selfdestruct(payable(owner));  // Irreversible destruction
    }
}
