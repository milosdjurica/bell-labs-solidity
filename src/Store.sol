// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Store {
    mapping(address => mapping(uint256 => string)) s_notes;
    uint256 public s_lastId;

    function storeNote(string memory note_) external {
        s_lastId++;
        s_notes[msg.sender][s_lastId] = note_;
    }

    function getNote(uint256 id_) external view returns (string memory) {
        return s_notes[msg.sender][id_];
    }
}
