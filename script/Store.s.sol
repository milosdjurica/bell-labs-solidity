// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Store} from "../src/Store.sol";

contract DeployStore is Script {
    Store store;

    function run() external returns (Store) {
        vm.startBroadcast();
        store = new Store();
        vm.stopBroadcast();
        return store;
    }
}
