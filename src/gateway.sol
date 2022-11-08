// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Gateway is Relayable {

    event Created(
        uint256 time,
        uint256 indexed topic,
        uint256 indexed post,
        address indexed author,
        string forum,
        string title,
        string text
    );

    function create(
        uint256 time,
        uint256 topic,
        uint256 post,
        address author,
        string calldata forum,
        string calldata title,
        string memory text
    ) public onlyRelayer {
        emit Created(time, topic, post, author, forum, title, text);
    }

    event Replied(
        uint256 time,
        uint256 indexed topic,
        uint256 indexed post,
        address indexed author,
        string forum,
        string text
    );

    function reply(
        uint256 time,
        uint256 topic,
        uint256 post,
        address author,
        string calldata forum,
        string memory text
    ) public onlyRelayer {
        emit Replied(time, topic, post, author, forum, text);
    }

}
