// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Dockmaster.sol";
import "../src/DockmasterInterface.sol";

import "forge-std/console.sol";

contract DockmasterTest is Test {
    DockmasterInterface public dockmaster;

    event Hail(string message);
    error UnauthorizedMinter();

    function setUp() public {
        // Deploy a new Dockmaster contract for the test and get its address.
        Dockmaster dockmasterContract =
            new Dockmaster("Canonical Dockmaster", "DOCK");
        address dockmasterAddress = address(dockmasterContract);
        // Set the dockmaster variable to an instance of the Dockmaster
        // interface.
        dockmaster = DockmasterInterface(dockmasterAddress);
    }

    function testName() public {
        assertEq(dockmaster.name(), "Canonical Dockmaster");
    }

    function testSymbol() public {
        assertEq(dockmaster.symbol(), "DOCK");
    }

    function testHail() public {
        string memory expected = "Ahoy!";
        vm.expectEmit(false, false, false, true, address(dockmaster));
        emit Hail(expected);
        dockmaster.hail(expected);
    }

    function testTokenURI() public {
        vm.expectRevert("Token ID does not exist");
        dockmaster.tokenURI(type(uint128).max);

        vm.prank(address(0));
        dockmaster.mint(address(this));
        uint256 tokenId = dockmaster.currentId() - 1;
        dockmaster.tokenURI(tokenId);
    }

    function testMint() public {
        vm.prank(address(uint160(address(this)) >> (160 - 8)));
        dockmaster.mint(address(this));

        assertEq(dockmaster.ownerOf(1), address(this));
        assertEq(dockmaster.currentId(), 1);

        vm.expectRevert(abi.encodeWithSignature("UnauthorizedMinter()"));
        dockmaster.mint(address(this));

        assertEq(dockmaster.currentId(), 1);
    }
}
