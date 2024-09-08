pragma solidity ^0.5.0;

contract OverflowVulnerableToken {
    string public name = "OverflowToken";
    string public symbol = "OVR";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));
    mapping(address => uint256) public balanceOf;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value; // Potential underflow
        balanceOf[_to] += _value; // Potential overflow
        return true;
    }
}
