// pragma solidity >=0.4.22 <0.9.0;
// import "../lib/forge-std/src/Script.sol";
// import "../lib/forge-std/src/console.sol";
// import "../src/utils/BytesLib.sol";

// contract CastingSim is Script {
//     function run() public {
//         uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
//         vm.startBroadcast(deployerPrivateKey);
//         bytes20 msgSenderBytes20 = bytes20(msg.sender);
//         uint16 last16BitsOfMsgSender = uint16(uint160(msgSenderBytes20));
//         bytes2 last16BitsIntoBytes2 = bytes2(last16BitsOfMsgSender);
//         console.log("last16BitsIntoBytes2:");
//         console.logBytes2(last16BitsIntoBytes2);
//         bytes2 last16BitsIntoBytes2WithAbiEncode = bytes2(
//             abi.encodePacked(last16BitsOfMsgSender)
//         );
//         console.log("last16BitsIntoBytes2WithAbiEncode:");
//         console.logBytes2(last16BitsIntoBytes2WithAbiEncode);
//         console.log("                      ");
//         console.log("**********************");
//         console.log("                      ");
//         console.log("Var is uint256(256)");
//         uint256 uint256Var = 256;
//         console.log("uint256 of Var:");
//         console.log(uint256Var);
//         bytes32 uintToBytes = bytes32(uint256Var);
//         console.log("VarToBytes:");
//         console.logBytes32(uintToBytes);
//         uint256 bytesToUint = uint256(uintToBytes);
//         console.log("bytesBackToUint:");
//         console.log(bytesToUint);
//         console.log("                      ");
//         console.log("**********************");
//         console.log("                      ");
//         console.log("msg.sender is var2");
//         address var2 = msg.sender;
//         console.log(var2);
//         console.log("address to bytes20");
//         bytes20 addressToBytes = bytes20(var2);
//         console.logBytes20(addressToBytes);
//         console.log("bytes20 to bytes32?");
//         bytes32 bytes20ToBytes32 = bytes32(addressToBytes);
//         console.logBytes32(bytes20ToBytes32);

//         console.log("cut bytes20 to bytes8");
//         bytes8 bytes20ToBytes8 = bytes8(addressToBytes);
//         console.logBytes8(bytes20ToBytes8);

//         console.log("cast bytes8 into uint64");
//         uint64 bytes8ToUint64 = uint64(bytes20ToBytes8);
//         console.log(bytes8ToUint64);

//         console.log("cut uint64 to uint32");
//         uint32 uint64ToUint32 = uint32(bytes8ToUint64);
//         console.log(uint64ToUint32);
//         console.log("cut uint64 to uint16");
//         uint16 uint64ToUint16 = uint16(bytes8ToUint64);
//         console.log(uint64ToUint16);

//         console.log("                      ");
//         console.log("**********************");
//         console.log("                      ");
//         console.log("cast bytes20 into uint160");
//         uint160 bytes20ToUint160 = uint160(addressToBytes);
//         console.log(bytes20ToUint160);
//         vm.stopBroadcast();
//     }
// }
