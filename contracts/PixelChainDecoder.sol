// SPDX-License-Identifier: MIT

/*

............................................................
............................................................
............................................................
........',;;,,;,;,;;,,,;,,,,,,,,,;;;;;;;,,,;,,;;,;,.........
........'::,;cccccccccccccccccccccccccccccccccc;,:;. .......
........':;.,ccccccccccccccccccccccccccccc::ccc,.;;. .......
........':;.,:,..............................,:,.;;. .......
........':;.,:.  ............................,:,.;;. .......
........':;.,:. .............................,:,.;;. .......
........':;.,:. .............................;:,.;;. .......
........':;.,:. .............................;:,.;;. .......
.....',;:l:';c'.........',;;,'''''''........':o:,::...'.....
...',,cddl:;;;;,......',;cdoc:;;;;;,......',;oxoc:;;;;,.....
..'::. .........co;.';:;..  ..   ..'ll,.';:,..  ...   .:,  .
..'::. .':,.':;;dOo;;;:;..  ......':kOl;;;;,.   .;;. .,c,  .
...',..,;c:;:c;.',.  .',...',,;,,,'.,'.  .''...',:c'.,,,.  .
......,,,,,,,,,'........',,,,,,,,,,'........',,,,,,,,,..  ..
......  ......  .........          ............. ..   ......
........':;.,:. .............................;:,.;;. .......
........':;.,:. .............................;:,.;;. .......
........':;.,:. .............................;:,.;;. .......
........':;.,:. .............................;:,.;;. .......
........':;.,:' .............................;:,.;;. .......
........':;.,c:;;;::;::::::::::::::::::::;::::c,.;;. .......
........':;',cccccccc:cccccccccc::::::::cc:cccc,';;. .......
........';;;;:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,. .......
..................................................   .......
............................................................
............................................................
............................................................

by patrick piemonte for the PixelChain team

*/

pragma solidity 0.8.18;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


interface IPixelChain {
    function pixelChains(uint256 index) external view returns (string memory, bytes memory, bytes memory, address, uint256);
}


library PixelChainLibrary {
    struct PixelChain {
        string name;
        bytes data;
        bytes palette;
        address author;
        uint256 date;
    }

    function fromPXC(string memory name, bytes memory data, bytes memory palette, address author, uint256 date) internal pure returns (PixelChain memory) {
        return PixelChain(name, data, palette, author, date);
    }
}


contract PixelChainDecoder is Ownable {

    struct Cursor {
        uint8 x;
        uint8 y;
    }

    uint256 constant SVG_DIMENSION = 32;
    uint256 constant SVG_COLOR_MAX = 16;

    IPixelChain public _pxc = IPixelChain(0xbc0E164eE423B7800e355b012c06446e28b1a29d);

    function setPixelChainContract(address pxcAddress) public onlyOwner {
        require(pxcAddress != address(0), "PixelChainDecoder: pxcAddress cannot be a zero address");
        _pxc = IPixelChain(pxcAddress);
    }

    function uintToHexDigit(uint256 value) internal pure returns (bytes1) {
        if (value < 10) {
            return bytes1(uint8(value) + uint8(bytes1('0')));
        } else {
            return bytes1(uint8(value - 10) + uint8(bytes1('a')));
        }
    }

    function uintToStr(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function toHexString(uint8 r, uint8 g, uint8 b) internal pure returns (string memory) {
        bytes memory hexString = new bytes(6);
        hexString[0] = uintToHexDigit(r >> 4);
        hexString[1] = uintToHexDigit(r & 0x0f);
        hexString[2] = uintToHexDigit(g >> 4);
        hexString[3] = uintToHexDigit(g & 0x0f);
        hexString[4] = uintToHexDigit(b >> 4);
        hexString[5] = uintToHexDigit(b & 0x0f);
        return string(hexString);
    }

    function paletteToHexColors(bytes memory palette) internal pure returns (string[SVG_COLOR_MAX] memory) {
        require(((palette.length % 3) == 0) && palette.length > 0, "PixelChainDecoder: invalid palette");
        string[SVG_COLOR_MAX] memory colors;
        uint256 colorIndex = 0;

        for (uint256 i = 0; i < palette.length; i += 3) {
            uint8 r = uint8(palette[i]);
            uint8 g = uint8(palette[i + 1]);
            uint8 b = uint8(palette[i + 2]);

            if (colorIndex < SVG_COLOR_MAX) {
                colors[colorIndex] = toHexString(r, g, b);
                colorIndex++;
            } else {
                break;
            }
        }

        return colors;
    }

    function pixel4(Cursor memory cursor, string[4] memory hexColors) internal pure returns (bytes memory) {
        string memory yStr = uintToStr(cursor.y);
        return abi.encodePacked(
            '<rect x="', uintToStr(cursor.x), '" y="', yStr, '" width="1" height="1" fill="#', hexColors[0], '"/>',
            '<rect x="', uintToStr(cursor.x + 1), '" y="', yStr, '" width="1" height="1" fill="#', hexColors[1], '"/>',                
            abi.encodePacked(
                '<rect x="', uintToStr(cursor.x + 2), '" y="', yStr, '" width="1" height="1" fill="#', hexColors[2], '"/>', 
                '<rect x="', uintToStr(cursor.x + 3), '" y="', yStr, '" width="1" height="1" fill="#', hexColors[3], '"/>'
            )
        );
    }

 
    function generateSvgImage(bytes memory imgData, bytes memory palette)
        public
        pure
        returns (string memory)
    {
        require((imgData.length % 4) == 0, "PixelChainDecoder: invalid image data");

        string[SVG_COLOR_MAX] memory colors = paletteToHexColors(palette);

        bytes memory svgBytes = abi.encodePacked(
            '<?xml version="1.0" encoding="UTF-8" standalone="no"?><svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 32 32">'
        );

        Cursor memory cursor = Cursor(0, 0);
        bytes[8] memory svgPixels;
        string[4] memory hexColors;

        for (uint256 i = 0; i < SVG_DIMENSION; i++) {
            uint256 idy = i * 32;

            hexColors[0] = colors[uint8(imgData[idy])];
            hexColors[1] = colors[uint8(imgData[idy + 1])];
            hexColors[2] = colors[uint8(imgData[idy + 2])];
            hexColors[3] = colors[uint8(imgData[idy + 3])];
            svgPixels[0] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[1] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[2] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[3] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[4] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[5] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[6] = pixel4(cursor, hexColors);
            cursor.x += 4;

            hexColors[0] = colors[uint8(imgData[idy + cursor.x])];
            hexColors[1] = colors[uint8(imgData[idy + cursor.x + 1])];
            hexColors[2] = colors[uint8(imgData[idy + cursor.x + 2])];
            hexColors[3] = colors[uint8(imgData[idy + cursor.x + 3])];
            svgPixels[7] = pixel4(cursor, hexColors);
            cursor.x += 4;

            svgBytes = abi.encodePacked(
                svgBytes,
                svgPixels[0],
                svgPixels[1],
                svgPixels[2],
                svgPixels[3],
                svgPixels[4],
                svgPixels[5],
                svgPixels[6],
                svgPixels[7]
            );

            if (cursor.x >= 32) {
                cursor.x = 0;
                cursor.y++;
            }
        }

        svgBytes = abi.encodePacked(svgBytes, '</svg>');

        return string(svgBytes);
    }
    
    function generatePixelChainImage(uint256 tokenId)
        external
        view
        returns (string memory) {
        require(tokenId < 2804); // v1 token limit
        (string memory name, bytes memory data, bytes memory palette, address author, uint256 date) = _pxc.pixelChains(tokenId);
        PixelChainLibrary.PixelChain memory pxc = PixelChainLibrary.fromPXC(name, data, palette, author, date);
        string memory svgImage = generateSvgImage(pxc.data, pxc.palette);
        return  svgImage;
    }
    
}

