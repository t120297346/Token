const BmeToken = artifacts.require("BmeToken");
const BmeTokenSale = artifacts.require("BmeTokenSale");

module.exports = function (deployer) {
  deployer.deploy(BmeToken, 1000000).then(function(){
  	// token price is 0.001 ETH 
  	var tokenPrice = 1000000000000000
  	return deployer.deploy(BmeTokenSale, BmeToken.address, tokenPrice);
  });
};

  