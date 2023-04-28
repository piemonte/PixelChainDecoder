const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PixelChainDecoder contract", function () {
  it("deployment should generate image for token 904", async function () {
    const decoder = await ethers.getContractFactory("PixelChainDecoder");
    const hardhatDecoder = await decoder.deploy();

    const svgImage = await hardhatDecoder.generateSvgImage(904);
    const expectedSvgImage = "your expected SVG image string goes here"; // Update this line with the expected SVG image string

    console.log("SVG Image: ", svgImage);

    expect(svgImage).to.include("<svg");
    expect(svgImage).to.include('xmlns="http://www.w3.org/2000/svg"');
    expect(svgImage).to.include('width="32"');
    expect(svgImage).to.include('height="32"');
    expect(svgImage).to.include(
      '<rect x="0" y="0" width="1" height="1" fill="#d8d8d8"/>'
    );

    expect(svgImage).to.equal(expectedSvgImage);
  });
});
