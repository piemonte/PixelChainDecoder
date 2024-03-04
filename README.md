# ⛓️ PixelChainDecoder (v1)

Welcome to the [PixelChainDecoder](https://etherscan.io/address/0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1#code), an on-chain decoder dedicated to rendering the [PixelChain](https://pixelchain.art/) "Classic" collection. This Ethereum smart contract deciphers the on-chain data from the [original PixelChain contract](https://etherscan.io/address/0xbc0E164eE423B7800e355b012c06446e28b1a29d#code) and generates a full-color SVG image directly from the blockchain.

[By reading the Ethereum contract using Etherscan](https://etherscan.io/address/0xE2d43Ec2516C2446a6DDc95734c9a0eC21B01dC1#readContract), one can enter a PixelChain token id into the `generatePixelChainImage` function. The contract will then generate the resulting SVG image which could be used in services or simply pasted into a text file with the extension ".svg" – you will then have a high resolution PixelChain vector image.

This project's on-chain contract interfaces directly with the original PixelChainCore contract using all the available on-chain data.

## What's PixelChain?

Pixelchain is a decentralized app that allows anyone to create 32x32 pixelart and store it directly on the Ethereum blockchain, where it will live forever as an ERC-721 token.

The original PixelChain contract (PixelChain "Classic") is now closed making the first [2,804 tokens](https://opensea.io/collection/pixelchain?search[stringTraits][0][name]=Version&search[stringTraits][0][values][0]=PixelChain&search[stringTraits][0][values][1]=PixelChain%20Classic) a limited edition. Back in the day, it attracted a range of talented crypto artists: [@Coldie](https://twitter.com/coldie), [@money_alotta](https://twitter.com/money_alotta), [@hackatao](https://twitter.com/hackatao), [@mattiac](https://twitter.com/mattiac), [@neurocolor](https://twitter.com/neurocolor), [@robnessofficial](https://twitter.com/robnessofficial), [@XCOPYART](https://twitter.com/xcopyart) just to name a few.

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
