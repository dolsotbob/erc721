// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// (나) 수업자료 6쪽 예제 가져와서 부모 컨트랙트 확앤 해보기 (예제로도 통과)

contract MyNFT is ERC721URIStorage {
    uint256 private _tokenIds; // (나) 얘를 통해 total supply 확인 가능

    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) {}

    function mint(
        address recipient,
        string memory tokenURI
    ) public returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
