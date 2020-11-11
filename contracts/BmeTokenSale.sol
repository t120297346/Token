pragma solidity ^0.5.16;
import "./BmeToken.sol";

contract BmeTokenSale{
    address admin;
    BmeToken public tokenContract;
    uint256 public tokenPrice;

    constructor(BmeToken _tokenContract, uint256 _tokenPrice) public{
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
} 