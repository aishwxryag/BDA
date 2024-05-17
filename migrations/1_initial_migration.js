const CredentialVerifier = artifacts.require("CredentialVerifier");

module.exports = function (deployer) {
  deployer.deploy(CredentialVerifier);
};
module.exports = async function (deployer) {
  // Deploy your contract if needed
  await deployer.deploy(CredentialVerifier);

  // Get an instance of the deployed contract
  const votingInstance = await CredentialVerifier.deployed();
 

  // Now you can interact with the contract using votingInstance
  // For example, calling a function:
  const result = await votingInstance.getVote(0);
  // console.log(result);
};
