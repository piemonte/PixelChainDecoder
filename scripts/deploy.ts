import { ethers } from "hardhat";

async function main() {
  const pxc = "0xbc0E164eE423B7800e355b012c06446e28b1a29d";

  const Decoder = await ethers.getContractFactory("Decoder");
  const decoder = await Decoder.deploy();

  await decoder.deployed();
  console.log("PixelChain Decoder deployed to:", decoder.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
