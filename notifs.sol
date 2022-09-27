// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Notifs is Relayable {

    event Seen(
        address indexed id
    );

    function see(
        address id
    ) public onlyRelayer {
        emit Seen(id);
    }
    
}
