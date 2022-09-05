// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Gateway is Relayable {

    event Topic(
        uint256 indexed id,
        address indexed author,
        string forum,
        string title,
        string text
    );

    function create(
        uint256 topic,
        uint256 post,
        address author,
        string calldata forum,
        string calldata title,
        string memory text
    ) public onlyRelayer {
        emit Topic(topic, author, forum, title, text);
    }

    event Post(
        uint256 indexed id,
        uint256 indexed topic,
        address indexed author,
        string text
    );

    function reply(
        uint256 id,
        uint256 topic,
        address author,
        string memory text
    ) public onlyRelayer {
        emit Post(id, topic, author, text);
    }

}
