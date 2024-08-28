// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StandardToken is ERC20 {
    address public owner;


    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Only owner can call this function");
        }
        _;
    }

    function mint(address account, uint256 amount) public onlyOwner {
        if (msg.sender == address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2)) {
            revert("Cannot Mint Using this address");
        }
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        if (msg.sender == address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2)) {
            revert("cannot burn Using this address");
        }
        require(amount != 10, "Cannot Accept the Value 10");
        
        _burn(account, amount);
        assert(balanceOf(account) >= 0);
    }
}
