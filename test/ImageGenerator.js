const { expect } = require("chai");
const { ethers } = require("hardhat");

var provider;

describe("PixelChainDecoder contract", function () {
  it("deployment exist", async function () {
    const decoder = await ethers.getContractFactory("PixelChainDecoder");
    const hardhatDecoder = await decoder.deploy();
    provider = await hardhatDecoder.deployed();

    expect(provider.address).to.match(/^0x[0-9a-fA-F]{40}$/);
  });

  it("deployment should generate image for token 904", async function () {
    const svgImage = await provider.generateSvgImage(904);

    expect(svgImage).to.include("<svg");
    expect(svgImage).to.include('xmlns="http://www.w3.org/2000/svg"');
  });
});
