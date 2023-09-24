// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract CustomToken {

    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;
    //mapping variable 

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol) {
        tokenName = _name;
        tokenSymbol = _symbol;
        totalSupply = 0;
    }

    function generateTokens(address account, uint256 amount) public {
        require(account != address(0), "Invalid address");
        totalSupply += amount;
        balances[account] += amount;
    }

    function eraseTokens(address account, uint256 amount) public {
        require(account != address(0), "Invalid address");
        require(balances[account] >= amount, "Insufficient balance");
        totalSupply -= amount;
        balances[account] -= amount;
    }
}

