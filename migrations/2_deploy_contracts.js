const BmeToken = artifacts.require("BmeToken");

module.exports = function (deployer) {
  deployer.deploy(BmeToken);
};