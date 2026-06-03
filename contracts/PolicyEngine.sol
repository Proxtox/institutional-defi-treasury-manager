// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Policy Engine for Treasury
contract PolicyEngine {
    address public admin;
    mapping(bytes32 => bool) public allowedActions;

    constructor() {
        admin = msg.sender;
    }

    function setPolicy(bytes32 action, bool allowed) external {
        require(msg.sender == admin, "Only admin");
        allowedActions[action] = allowed;
    }

    function isAllowed(bytes32 action) external view returns (bool) {
        return allowedActions[action];
    }
}