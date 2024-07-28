// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestToken is ERC721, Ownable {
    uint256 public nextTokenId;

    constructor() ERC721("YbnDao", "YBN") {}

    function mintToken() public onlyOwner {
        _safeMint(msg.sender, nextTokenId);
        nextTokenId++;
    }

    function burnToken(uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner of this token");
        _burn(tokenId);
    }
}

