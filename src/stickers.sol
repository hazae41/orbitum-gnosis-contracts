// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "./relayable.sol";

contract Stickers is ERC721, Relayable {

    uint256 _lastTokenId = 1;

    mapping(string => uint256) _tokenIdByHash;

    mapping(uint256 => string) _hashByTokenId;
    mapping(uint256 => string) _tagsByTokenId;

    constructor() ERC721("Stickorz", "STCKRZ") {}

    function tokenOf(string calldata hash) public view returns (uint256) {
        return _tokenIdByHash[hash];
    }

    function hashOf(uint256 tokenId) public view returns (string memory) {
        return _hashByTokenId[tokenId];
    }

    function tagsOf(uint256 tokenId) public view returns (string memory) {
        return _tagsByTokenId[tokenId];
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    event Minted(address indexed owner, uint256 indexed tokenId, string hash, string tags);

    function mint(address to, string calldata hash, string calldata tags) public onlyRelayer {
        require(_tokenIdByHash[hash] == 0, "Stickers: Hash already exists");

        uint256 tokenId = _lastTokenId++;

        _safeMint(to, tokenId);

        _hashByTokenId[tokenId] = hash;
        _tagsByTokenId[tokenId] = tags;

        _tokenIdByHash[hash] = tokenId;

        emit Minted(to, tokenId, hash, tags);
    }

}