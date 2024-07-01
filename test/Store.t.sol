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
        string memory returnedNote = store.getNote(1);
        assertEq(returnedNote, testNote, "Real note should match the test note");
    }

    function test_storeNote_BadID() public view {
        string memory returnedNote = store.getNote(999);
        assertEq(returnedNote, "", "Bad ID should return empty string");
    }

    function test_storeNote_StoreMultipleNotes() public {
        string memory note1 = "First note";
        string memory note2 = "Second note";

        store.storeNote(note1);
        store.storeNote(note2);

        string memory returnedNote1 = store.getNote(1);
        string memory returnedNote2 = store.getNote(2);

        assertEq(returnedNote1, note1, "First stored note should match note1");
        assertEq(returnedNote2, note2, "Second stored note should match note2");
    }

    function testStoreNoteDifferentUsers() public {
        string memory noteUser1 = "User1's note";
        string memory noteUser2 = "User2's note";

        address user1 = makeAddr("user1");
        address user2 = makeAddr("user2");

        vm.prank(user1);
        store.storeNote(noteUser1);

        vm.prank(user2);
        store.storeNote(noteUser2);

        string memory returnedNoteUser1 = store.getNote(1);
        assertEq(returnedNoteUser1, noteUser1, "User1's stored note should match");

        vm.prank(user2);
        string memory returnedNoteUser2 = store.getNote(2);
        assertEq(returnedNoteUser2, noteUser2, "User2's stored note should match");
    }
}
