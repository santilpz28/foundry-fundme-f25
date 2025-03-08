// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    // Vm public vm = Vm(address(uint160(uint256(keccak256('hevm cheat code')))));

    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig(); //For no speding gas
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
        vm.stopBroadcast();
        return fundMe;
    }
}
