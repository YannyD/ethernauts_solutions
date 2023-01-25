pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/GateTwoCracker.sol";
import "../lib/forge-std/src/console.sol";

contract EnterGateTwo is Script {
    GateTwoCracker gateTwoCracker;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        //enter your contract address into the cracker
        gateTwoCracker = new GateTwoCracker(
            address(0x10eb874b47D72c615C8Ae9d90409bba2D032419c)
        );

        vm.stopBroadcast();
    }
}
