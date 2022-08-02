// SPDX-License-Identifier:MIT

pragma solidity >=0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 waves;
    uint256 public seed;

    struct Waves {
        address user;
        string message;
        uint256 timestamp;
    }

    mapping(address => uint256) public lastWavedAt;

    Waves[] waveArr;

    event waveNotifier(address indexed user, string message, uint256 timestamp);

    constructor() {
        console.log("Yo yo, I am a contract and I am smart");
        seed = (block.timestamp + block.difficulty) % 100;
    }

    function wave(string memory _msg) public {
        lastWavedAt[msg.sender] = block.timestamp;
        console.log("A new wave made");
        waves += 1;
        waveArr.push(Waves(msg.sender, _msg, block.timestamp));
        seed = (block.difficulty + block.timestamp + seed) % 100;
        emit waveNotifier(msg.sender, _msg, block.timestamp);
    }

    function getTotalWaves() public view returns (Waves[] memory) {
        console.log("Total Waves = ", waves);
        return waveArr;
    }
}
