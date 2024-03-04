# ⛓️ PixelChainDecoder (v1)

Welcome to the [PixelChainDecoder](https://etherscan.io/address/0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1#code), an on-chain decoder dedicated to rendering the [PixelChain](https://pixelchain.art/) "Classic" collection. This Ethereum smart contract deciphers the on-chain data from the [original PixelChain contract](https://etherscan.io/address/0xbc0E164eE423B7800e355b012c06446e28b1a29d#code) and generates a full-color SVG image directly from the blockchain.

- [Pixelchain Classic on MagicEden](https://magiceden.io/collections/ethereum/0xbc0e164ee423b7800e355b012c06446e28b1a29d)
- [Pixelchain Classic History](https://twitter.com/ImsickOk/status/1757374493121491187)
- [The Doomed DAO and XCOPY 10](https://twitter.com/thedoomedxyz/status/1763578678275969407)

## Usage

To generate a PixelChain image:

1. Visit [the Ethereum contract using Etherscan](https://etherscan.io/address/0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1#readContract).
2. Enter a PixelChain token id into the `generatePixelChainImage` function.
3. Execute the function to generate a resulting SVG image.

Optional: You can paste the resulting data into a text file with the extension ".svg" – you will then have a high resolution PixelChain vector image!

The PixelChainDecoder contract interfaces directly with the original PixelChainCore contract using all the available on-chain data.

## About PixelChain

Pixelchain is a decentralized application (DApp) that enables anyone to create 32x32 pixelart and store it directly on the Ethereum blockchain, where it will live forever as an ERC-721 token.

The original PixelChain contract (PixelChain "Classic") is now closed making the first [2,804 tokens](https://opensea.io/collection/pixelchain?search[stringTraits][0][name]=Version&search[stringTraits][0][values][0]=PixelChain&search[stringTraits][0][values][1]=PixelChain%20Classic) a limited edition. When it launched it attracted a range of prominent crypto artists: [@Coldie](https://twitter.com/coldie), [@money_alotta](https://twitter.com/money_alotta), [@hackatao](https://twitter.com/hackatao), [@mattiac](https://twitter.com/mattiac), [@neurocolor](https://twitter.com/neurocolor), [@robnessofficial](https://twitter.com/robnessofficial), [@XCOPYART](https://twitter.com/xcopyart) just to name a few.

The great team behind PixelChain has moved on and is now focused on new projects, so I provided this code to them incase they would find it helpful.

## Quick Start

Install Node.js 18.x.x.

``
npm install
``

``
make compile
``

## Contracts

| Contract           | Etherscan                                                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| PixelChainDecoder  | [0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1](https://etherscan.io/address/0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1#code)                                                                 |
| PixelChainCore     | [0xbc0E164eE423B7800e355b012c06446e28b1a29d](https://etherscan.io/address/0xbc0E164eE423B7800e355b012c06446e28b1a29d#code) |

## Resources

- [PixelChain Website](https://pixelchain.art/)
- [Off-chain v1 Decoder Website](https://pixelchain.art/decoder?version=1)
- [Off-chain v1 Decoder Source](https://github.com/PixelChainDapp/PixelChain-GoLang-Decoder)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [OpenSea Metadata standards](https://docs.opensea.io/docs/metadata-standards)
- [Hardhat](https://hardhat.org)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
