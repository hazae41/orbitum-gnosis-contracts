// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract JVArchive is Relayable {

    event Created(
        uint256 time,
        uint256 indexed forum,
        uint256 indexed topic,
        uint256 indexed post,
        string title,
        string text
    );

    function create(
        uint256 time,
        uint256 forum,
        uint256 topic,
        uint256 post,
        string calldata title,
        string calldata text
    ) public onlyRelayer {
        emit Created(time, forum, topic, post, title, text);
    }

    event Replied(
        uint256 time,
        uint256 indexed topic,
        uint256 indexed post,
        string text
    );

    function reply(
        uint256 time,
        uint256 topic,
        uint256 post,
        string calldata text
    ) public onlyRelayer {
        emit Replied(time, topic, post, text);
    }

}
