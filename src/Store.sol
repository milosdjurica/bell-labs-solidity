// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Store
 * @dev A simple contract to store and retrieve notes. Each user can store multiple notes,
 *      each identified by a unique ID.
 */
contract Store {
    /// @notice Mapping to store notes for each address, identified by a unique ID.
    mapping(address => mapping(uint256 => string)) s_notes;

    /// @notice Keeps track of the last ID used for notes.
    uint256 public s_lastId;

    /**
     * @notice Stores a new note for the sender.
     * @dev Each note is stored under a new ID, which is incremented for each note stored.
     * @param note_ The content of the note to be stored.
     */
    function storeNote(string memory note_) external {
        s_lastId++;
        s_notes[msg.sender][s_lastId] = note_;
    }

    /**
     * @notice Retrieves a note by its ID for the sender. Only owner of the note can read it.
     * @param id_ The ID of the note to retrieve.
     * @return The content of the note with the specified ID.
     */
    function getNote(uint256 id_) external view returns (string memory) {
        return s_notes[msg.sender][id_];
    }
}
