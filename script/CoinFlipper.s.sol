// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;
import "../src/Solutions/CoinFlipGuesser.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract CoinFlipper is Script {
    CoinFlip coinflip = new CoinFlip();

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
