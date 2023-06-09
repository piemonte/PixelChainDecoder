# ⛓️ PixelChainDecoder (v1)

This is an on-chain decoder for the [PixelChain](https://pixelchain.art/) "Classic" collection.

For example, [by reading the contract](https://etherscan.io/address/0x6E5989599301EFF542594bC638C2B8cd5d5d29a1#readContract), enter a token id into the `generatePixelChainImage` function and then paste the result into a text file with an extension ".svg" – you will then have the resulting PixelChain vector image.

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
| PixelChainDecoder  | [0x6E5989599301EFF542594bC638C2B8cd5d5d29a1](https://etherscan.io/address/0x6E5989599301EFF542594bC638C2B8cd5d5d29a1#code)                                                                 |
| PixelChainCore     | [0xbc0E164eE423B7800e355b012c06446e28b1a29d](https://etherscan.io/address/0xbc0E164eE423B7800e355b012c06446e28b1a29d#code) |

## Resources

- [PixelChain Website](https://pixelchain.art/)
- [Off-chain v1 Decoder Website](https://pixelchain.art/decoder?version=1)
- [Off-chain v1 Decoder Source](https://github.com/PixelChainDapp/PixelChain-GoLang-Decoder)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [OpenSea Metadata standards](https://docs.opensea.io/docs/metadata-standards)
- [Hardhat](https://hardhat.org)
