pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Challenge/Token.sol";
import "../lib/forge-std/src/console.sol";

contract TokenOverflow is Script {
    Token token;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        token = Token(0x6C78738B1AEc1D86A1425bE2568341E39EC90600);

        // uint256 sentValue = uint256(-1);

        uint256 answer = token.balanceOf(
            address(0xec485e125D83C45cdCC734A7386A49ba994dFc1d)
        );
        console.log(answer);
        // token.transfer(
        //     address(0x0000000000000000000000000000000000000000),
        //     sentValue
        // );
        vm.stopBroadcast();
    }
}
