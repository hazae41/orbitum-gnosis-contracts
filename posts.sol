pragma solidity >=0.8.7;

// SPDX-License-Identifier: WTFPL

contract Orbitum {
    event Topic(
			string indexed forum,
			address indexed author, 
			string title, 
			string text
		);

    function create(
        string calldata forum,
        string calldata title,
        string memory text
    ) public {
        emit Topic(forum, msg.sender, title, text);
    }

    event Post(
			string indexed topic, 
			address indexed author, 
			string text
		);

    function reply(
			string calldata topic, 
			string memory text
		) public {
        emit Post(topic, msg.sender, text);
    }
}
