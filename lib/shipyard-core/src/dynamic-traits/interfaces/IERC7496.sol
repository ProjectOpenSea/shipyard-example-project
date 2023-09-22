// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {IERC165} from "forge-std/interfaces/IERC165.sol";

interface IERC7496 is IERC165 {
    error InvalidTraitValue(bytes32 traitKey, bytes32 traitValue);

    /* Events */
    event TraitUpdated(bytes32 indexed traitKey, uint256 indexed tokenId, bytes32 trait);
    event TraitUpdatedBulkConsecutive(bytes32 indexed traitKeyPattern, uint256 fromTokenId, uint256 toTokenId);
    event TraitUpdatedBulkList(bytes32 indexed traitKeyPattern, uint256[] tokenIds);
    event TraitLabelsURIUpdated(string uri);

    /* Getters */
    function getTraitValue(bytes32 traitKey, uint256 tokenId) external view returns (bytes32 traitValue);
    function getTraitValues(bytes32 traitKey, uint256[] calldata tokenIds)
        external
        view
        returns (bytes32[] memory traitValues);
    function getTotalTraitKeys() external view returns (uint256);
    function getTraitKeys() external view returns (bytes32[] memory traitKeys);
    function getTraitKeyAt(uint256 index) external view returns (bytes32 traitKey);
    function getTraitLabelsURI() external view returns (string memory labelsURI);

    /* Setters */
    function setTrait(bytes32 traitKey, uint256 tokenId, bytes32 value) external;
    function deleteTrait(bytes32 traitKey, uint256 tokenId) external;
}
