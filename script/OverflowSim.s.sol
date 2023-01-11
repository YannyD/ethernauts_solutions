// pragma solidity >=0.4.22 <0.9.0;
// import "../lib/forge-std/src/Script.sol";
// import "../src/Challenge/Token.sol";
// import "../lib/forge-std/src/console.sol";

// contract OverflowSim is Script {
//     function run() public {
//         //casting examples

//         uint16 resultEvenOne = uint16(65537);
//         console.log("uint16(65537):");
//         console.log(resultEvenOne);
//         uint16 resultEven = uint16(65536);
//         console.log("uint16(65536):");
//         console.log(resultEven);
//         uint16 resultSeven = uint16(65535);
//         console.log("uint16(65535):");
//         console.log(resultSeven);
//         uint8 resultEight = uint8(256);
//         console.log("uint8(256):");
//         console.log(resultEight);
//         uint8 resultOneEight = uint8(255);
//         console.log("uint8(255):");
//         console.log(resultOneEight);
//         uint8 resultEightOne = uint8(1);
//         console.log("uint8(1):");
//         console.log(resultEightOne);
//         uint8 resultNegOne = uint8(-1);
//         console.log("uint8(-1):");
//         console.log(resultNegOne);
//         uint256 resultOneFiftySix = uint256(255);
//         console.log("uint256(255):");
//         console.log(resultOneFiftySix);

//         uint256 MAX_INT = uint256(-1);
//         console.log("uint256(-1) (MAX_INT):");
//         console.log(MAX_INT);
//         uint256 result1 = MAX_INT + 1;
//         console.log("MAX_INT + 1:");
//         console.log(result1);
//         uint256 result2 = 20 - MAX_INT;
//         console.log("20 - MAX_INT:");
//         console.log(result2);

//         //         == Logs ==
//         //   uint16(65537):
//         //   1
//         //   uint16(65536):
//         //   0
//         //   uint16(65535):
//         //   65535
//         //   uint8(256):
//         //   0
//         //   uint8(255):
//         //   255
//         //   uint8(1):
//         //   1
//         //   uint8(-1):
//         //   255
//         //   uint256(255):
//         //   255
//         //   MAX_INT + 1:
//         //   0
//         //   20 - MAX_INT:
//         //   21
//     }
// }
