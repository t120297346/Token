var BmeTokenSale = artifacts.require('BmeTokenSale');

contract('BmeTokenSale', function(accounts){
	var tokenSaleInstance;
    var tokenPrice = 1000000000000000; // in wei

	it('initialize the contract with the correct values', function(){
		return BmeTokenSale.deployed().then(function(instance){
            tokenSaleInstance = instance;
            return tokenSaleInstance.address;
		}).then(function(address){
            assert.notEqual(address, '0x0', 'has contract address');
            return tokenSaleInstance.tokenContract();
		}).then(function(address){
            assert.notEqual(address, '0x0', 'has tokencontract address');
            return tokenSaleInstance.tokenPrice();
		}).then(function(price){
            assert.equal(price, tokenPrice, 'token price is correct');
		});
	});

/*
	it('initialize the contract with the correct values', function(){
		return BmeTokenSale.deployed().then(function(){
			
		})
	});
*/
})