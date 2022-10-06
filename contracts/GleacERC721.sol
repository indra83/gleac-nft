// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GleacNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("GleacNFT", "GN1") {}

    function _baseURI() internal pure override returns (string memory) {
        //return "https://storage.googleapis.com/public-mock-data/gleac/";
        return "https://gleac-nft-test.s3.ap-south-1.amazonaws.com/";
    }

    function safeMint(address to, uint batchSize) public onlyOwner {
        for(uint i = 1 ; i <= batchSize; i++) {
            uint256 tokenId = _tokenIdCounter.current();
            _tokenIdCounter.increment();
            _safeMint(to, tokenId);
        }
    }
}
