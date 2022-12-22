// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
import "../.deps/github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../.deps/github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../.deps/github/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";

contract QubixBeta is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Qubix_beta", "QUBIX") {}

    function mint(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _tokenIds.increment();
        return newItemId;
    }
}
