pragma solidity >=0.8.7;

// SPDX-License-Identifier: MIT

contract Gateway {
    address relayer;

    constructor() {
        relayer = msg.sender;
    }

    function transfer(address relayer2) public {
        require(msg.sender == relayer, "Not relayer");

        relayer = relayer2;
    }

    event Topic(
        uint256 indexed id,
        address indexed author,
        string forum,
        string title
    );

    function create(
        uint256 topic,
        uint256 post,
        address author,
        string calldata forum,
        string calldata title,
        string memory text
    ) public {
        require(msg.sender == relayer, "Not relayer");

        emit Topic(topic, author, forum, title);
        emit Post(post, topic, author, text);
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
    ) public {
        require(msg.sender == relayer, "Not relayer");

        emit Post(id, topic, author, text);
    }
}
