// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Script.sol";
// import {
//     AllowedEditor,
//     DisplayType,
//     Editors,
//     EditorsLib,
//     FullTraitValue,
//     TraitLabel
// } from "shipyard-core/dynamic-traits/lib/TraitLabelLib.sol";
// import "shipyard-core/reference/AbstractNFT.sol";

contract AddTraitScript is Script {
    // AbstractNFT myContract;

    function setUp() public {
        // // Add the address of the target contract to the script here.
        // myContract = AbstractNFT(0xA2f5cAC391645983Ac3cFE7704239172d6Af7f87);
    }

    function run() public {
        // // Build the trait label.
        // string[] memory acceptableValues = new string[](2);
        // acceptableValues[0] = "First Value";
        // acceptableValues[1] = "Second Value";

        // AllowedEditor[] memory allowedEditorRoles = new AllowedEditor[](2);
        // allowedEditorRoles[0] = AllowedEditor.Self;
        // allowedEditorRoles[1] = AllowedEditor.TokenOwner;

        // Editors editors = EditorsLib.aggregate(allowedEditorRoles);

        // TraitLabel memory label = TraitLabel({
        //     fullTraitKey: "Script test trait",
        //     traitLabel: "Script test trait",
        //     acceptableValues: acceptableValues,
        //     fullTraitValues: new FullTraitValue[](0),
        //     displayType: DisplayType.String,
        //     editors: editors,
        //     required: false
        // });

        // // Call the function to add the new label.
        // vm.broadcast();
        // myContract.setTraitLabel(bytes32("test.scriptTest"), label);
    }
}
