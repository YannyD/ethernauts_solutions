// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;
import "../src/Solutions/TelephoneRouter.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract TelephoneCracker is Script {
    TelephoneRouter phoneRouter;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        phoneRouter = new TelephoneRouter(
            0x0534E9D27Fd1e3Ce5d1b5033984c08b6E265CfaE
        );

        vm.stopBroadcast();
    }
}
