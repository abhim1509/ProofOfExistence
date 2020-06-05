const existenceProof = artifacts.require("ProofOfExistence");

module.exports = function(deployer) {
  deployer.deploy(existenceProof);
};
