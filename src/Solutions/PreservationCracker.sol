// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PreservationCracker {
    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    uint256 public owner;

    function setTime(uint256 _time) public {
        owner = _time;
    }
}
