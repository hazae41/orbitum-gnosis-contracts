pragma solidity >= 0.8.7;

// SPDX-License-Identifier: MIT

contract Gateway {
  address relayer;

  constructor() {
    relayer = msg.sender;
  }

  function transfer(
    address relayer2
  ) public {
    require(msg.sender == relayer, "Not relayer");

    relayer = relayer2;
  }

  event Topic(
    string indexed id,
    string indexed forum,
    address indexed author,
    string title,
    string text
  );

  function create(
    string calldata id,
    string calldata forum,
    address author,
    string calldata title,
    string memory text
  ) public {
    require(msg.sender == relayer, "Not relayer");

    emit Topic(id, forum, author, title, text);
  }

  event Post(
    string indexed id,
    string indexed topic, 
    address indexed author, 
    string text
  );

  function reply(
    string calldata id,
    string calldata topic, 
    address author,
    string memory text
  ) public {
    require(msg.sender == relayer, "Not relayer");
    
    emit Post(id, topic, author, text);
  }
}
