const Votes = artifacts.require("VoteManager");

module.exports = function (deployer) {
  deployer.deploy(Votes);
};
