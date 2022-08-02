// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Whitelist {
    // Maximum number of addreses that can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // Keep track of the number of addresses currently whitelisted
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        // Checks is the person is already on the whitelist, if they are they will not be added again.
        require(!whitelistedAddresses[msg.sender], "This address is already on the whitelist.");
        // Checks if  there is still space on the Whitelist 
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "The whitelist is full.");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
