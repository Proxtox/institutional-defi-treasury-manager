// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Institutional Treasury Manager
contract TreasuryManager {
    address public admin;
    mapping(address => uint256) public balances;

    event FundsMoved(address indexed from, address indexed to, uint256 amount);

    constructor() {
        admin = msg.sender;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function moveFunds(address to, uint256 amount) external {
        require(msg.sender == admin, "Only admin");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit FundsMoved(msg.sender, to, amount);
    }
}