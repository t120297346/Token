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

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

	mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;


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

	function approve(address _spender, uint256 _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

		return true;
	}

	function transferfrom(address _from, address _to, uint256 _value) public returns(bool success){
        // Exception if account doesn't have enough
        require(_value <= balanceOf[_from], 'cannot transfer value larger than balance');
        // Exception if allowance is not enough
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit  Transfer(_from, _to, _value);

		return true;
	}	
}