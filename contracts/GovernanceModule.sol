// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Governance Module for Treasury
contract GovernanceModule {
    address public admin;
    mapping(bytes32 => address) public proposals;

    constructor() {
        admin = msg.sender;
    }

    function createProposal(bytes32 proposalId, address target) external {
        require(msg.sender == admin, "Only admin");
        proposals[proposalId] = target;
    }
}