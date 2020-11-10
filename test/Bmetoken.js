var BmeToken = artifacts.require("BmeToken");

contract('BmeToken', function(accounts){
	it('sets the total supply upon deployment', function(){
        return BmeToken.deployed().then(function(instance){
        	tokenInstance = instance;
        	return tokenInstance.totalSupply();
        }).then(function(totalSupply){
        	assert.equal(totalSupply.toNumber(), 1000000, "set total supply to 1,000,000");
        });
	});
})