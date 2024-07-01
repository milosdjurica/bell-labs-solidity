// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {Store} from "../src/Store.sol";
import {DeployStore} from "../script/Store.s.sol";

contract StoreUnitTests is Test {
    Store store;
    DeployStore deployer;

    function setUp() public {
        deployer = new DeployStore();
        store = deployer.run();
    }
}
