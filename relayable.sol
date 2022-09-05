// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract Relayable {
    address relayer;

    constructor() {
        relayer = msg.sender;
    }

    modifier onlyRelayer() {
        require(msg.sender == relayer, "Not relayer");
        _;
    }

    function transfer(address relayer2) public onlyRelayer {
        relayer = relayer2;
    }
}
