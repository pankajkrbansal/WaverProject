// SPDX-License-Identifier:MIT

pragma solidity >= 0.8.0;

import "hardhat/console.sol";

contract WavePortal{
    uint256 waves;
    constructor(){
        console.log("Yo yo, I am a contract and I am smart");
    }
    function wave()public {
        console.log("A new wave made");
        waves += 1;
    }
    function getTotalWaves() public view returns(uint256){
        console.log("Total Waves = ", waves);
        return waves;
    }
}