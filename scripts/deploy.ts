import { ethers } from "hardhat";

async function main() {
  const Decoder = await ethers.getContractFactory("PixelChainDecoder");
  const decoder = await Decoder.deploy();

  await decoder.deployed();

  console.log("PixelChainDecoder deployed to:", decoder.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
