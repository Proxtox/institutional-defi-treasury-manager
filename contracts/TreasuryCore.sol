// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Treasury Core
contract TreasuryCore {
    address public admin;
    mapping(address => uint256) public holdings;

    constructor() {
        admin = msg.sender;
    }

    function deposit(address asset, uint256 amount) external {
        holdings[asset] += amount;
    }

    function withdraw(address asset, uint256 amount) external {
        require(msg.sender == admin, "Only admin");
        require(holdings[asset] >= amount, "Insufficient holdings");
        holdings[asset] -= amount;
    }
}