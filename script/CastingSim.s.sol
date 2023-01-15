pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";
import "../src/utils/BytesLib.sol";

contract CastingSim is Script {
    function run() public {
        uint256 uint256Var = 256;
        console.log("uint256Var:");
        console.log(uint256Var);
        bytes32 uintToBytes = bytes32(uint256Var);
        console.log("uintToBytes:");
        console.logBytes32(uintToBytes);
        uint256 bytesToUint = uint256(uintToBytes);
        console.log("bytesToUint:");
        console.log(bytesToUint);
    }
}
