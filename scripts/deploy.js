// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
  const unlockTime = currentTimestampInSeconds + ONE_YEAR_IN_SECS;

  // const lockedAmount = hre.ethers.utils.parseEther("1");

  const [usr1] = await hre.ethers.getSigners();
  const balance = await usr1.getBalance();
  
  console.log("Deploying contracts with account: ", usr1.address);
  console.log("Account balance: ", balance.toString());
  
  const waveContract = await hre.ethers.getContractFactory("WavePortal");
  const contract = await waveContract.deploy();

  await contract.deployed();

  console.log("Wave Contract At : ", contract.address);

  await contract.getTotalWaves();

  let wave = await contract.wave();
  wave.wait();

  await contract.getTotalWaves();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
