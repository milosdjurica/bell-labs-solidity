// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Store} from "../src/Store.sol";
import {DeployStore} from "../script/Store.s.sol";

contract StoreUnitTests is Test {
    Store store;
    DeployStore deployer;

    function setUp() public {
        deployer = new DeployStore();
        store = deployer.run();
    }

    function test_storeNote_Success() public {
        string memory testNote = "Hello, Foundry!";
        store.storeNote(testNote);
        string memory realNote = store.getNote(1);
        assertEq(realNote, testNote, "Real note should match the test note");
    }

    function test_storeNote_BadID() public view {
        assertEq(store.getNote(999), "", "Bad ID should return empty string");
    }
}
