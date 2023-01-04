// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.2;
import "../src/Solutions/CoinFlipGuesser.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract CoinFlipper is Script {
    CoinFlip coinflip = CoinFlip(0x292bbd9e5d52c36A2c28C8Fd51aC0540ecb31D10);

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        CoinFlipGuesser coinFlipGuesser = new CoinFlipGuesser(
            address(coinflip)
        );
        bool result = coinFlipGuesser.flipGuesser();
        vm.stopBroadcast();
        console.log(result);
    }
}
