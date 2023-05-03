import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  const balance = await ethers.utils.formatEther(await deployer.getBalance());
  console.log("Deploying with the account:", deployer.address);
  console.log("Account balance:", balance);

  const Decoder = await ethers.getContractFactory("PixelChainDecoder");
  const decoder = await Decoder.deploy();

  await decoder.deployed();

  console.log("PixelChainDecoder deployed to:", decoder.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
