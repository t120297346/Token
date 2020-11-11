pragma solidity ^0.5.16;

contract BmeToken {
	// Constructor 
	// Set the total number of tokens 
	// Read the total number of tokens
	uint256 public totalSupply;
	string public name = "BME Token";
	string public symbol = "BMEt";
	string public standard = "BME Token v1.0";

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

	mapping(address => uint256) public balanceOf;

	constructor(uint256 _initialSupply) public{
		balanceOf[msg.sender] = _initialSupply; // allocate the initial supply 
		totalSupply = _initialSupply;
	}

	function transfer(address _to, uint256 _value) public returns (bool success){
        // Exception if account doesn't have enough
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        
        return true;
	}
}