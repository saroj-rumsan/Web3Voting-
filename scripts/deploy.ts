import { ethers } from "hardhat";

async function main() {
  const Web3Voting = await ethers.deployContract("Web3Voting");

  await Web3Voting.waitForDeployment();

  console.log(`Contract deployed at address ${await Web3Voting.getAddress()}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
