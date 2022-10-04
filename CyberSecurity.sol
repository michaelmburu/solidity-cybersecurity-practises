// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract CyberSecurity {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function returnFunds() public view returns(bool) onlyOwner  {
        for (int256 i = 0; funders.length; i++) {
            funders[i].transfer(contributedAmount);
        }

        return true;
    }
}
