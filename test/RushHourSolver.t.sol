// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/RushHourSolver.sol";
import "../src/interface/IRushHourSolver.sol";
import "../src/Helper.sol";

contract RushHourSolverTest {
    using Helper for uint256;
    RushHourSolver private rushHourSolver;

    function setUp() public {
        rushHourSolver = new RushHourSolver();
        console.log("\n>>> Initial conditions");
    }

    function testSolveRushHourSolver() public view {
        uint8[6][6] memory inputData = getInputData(4);

        IRushHourSolver.Step[] memory steps = rushHourSolver.solve(inputData);

        for (uint256 i; i < steps.length; ++i) {
            console.log(steps[i].carId, steps[i].direction == IRushHourSolver.MovementDirection.Up ? "Up" : steps[i].direction == IRushHourSolver.MovementDirection.Right ? "Right" : steps[i].direction == IRushHourSolver.MovementDirection.Down ? "Down" : "Left");
        }
    }

    function getInputData(uint256 caseNum) public pure returns (uint8[6][6] memory inputData) {
        if (caseNum == 1) {
            inputData[0] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[1] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[2] = [uint8(1),uint8(1),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[3] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[4] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[5] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
        } else if (caseNum == 2) {
            inputData[0] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[1] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[2] = [uint8(1),uint8(1),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[3] = [uint8(0),uint8(2),uint8(2),uint8(2),uint8(0),uint8(0)];
            inputData[4] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[5] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
        } else if (caseNum == 3) {
            inputData[0] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[1] = [uint8(0),uint8(0),uint8(2),uint8(0),uint8(0),uint8(0)];
            inputData[2] = [uint8(1),uint8(1),uint8(2),uint8(3),uint8(0),uint8(0)];
            inputData[3] = [uint8(0),uint8(0),uint8(0),uint8(3),uint8(0),uint8(0)];
            inputData[4] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
            inputData[5] = [uint8(0),uint8(0),uint8(0),uint8(0),uint8(0),uint8(0)];
        } else {
            inputData[0] = [uint8(2),uint8(2),uint8(2),uint8(0),uint8(0),uint8(3)];
            inputData[1] = [uint8(0),uint8(0),uint8(4),uint8(0),uint8(0),uint8(3)];
            inputData[2] = [uint8(1),uint8(1),uint8(4),uint8(0),uint8(0),uint8(3)];
            inputData[3] = [uint8(5),uint8(0),uint8(4),uint8(0),uint8(6),uint8(6)];
            inputData[4] = [uint8(5),uint8(0),uint8(0),uint8(0),uint8(7),uint8(0)];
            inputData[5] = [uint8(8),uint8(8),uint8(8),uint8(0),uint8(7),uint8(0)];
        }
    }

}
