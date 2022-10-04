// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Topics is Relayable {

    uint16 version = 1;
    uint16 nonce = 0;

    function generate() internal returns (uint256) {
      return (((block.timestamp << 16) | version) << 16) | nonce++;
    }

    event Created(
        uint256 indexed topic,
        uint256 indexed post,
        address indexed author,
        string forum,
        string title,
        string text
    );

    function create(
        address author,
        string calldata forum,
        string calldata title,
        string memory text
    ) public onlyRelayer {
        uint256 topic = generate();
        uint256 post = generate();

        emit Created(topic, post, author, forum, title, text);
    }

    event Replied(
      uint256 indexed parent,
      uint256 indexed post,
      address indexed author,
      string text
    );

    function reply(
      address author,
      uint256 parent,
      string memory text
    ) public onlyRelayer {
      uint256 post = generate();

      emit Replied(parent, post, author, text);
    }

    event Renamed(
        uint256 indexed topic,
        string title
    );

    function rename(
        uint256 topic,
        string calldata title
    ) public onlyRelayer {
        emit Renamed(topic, title);
    }

    event Modified(
      uint256 indexed post,
      string text
    );

    function modify(
      uint256 post,
      string memory text
    ) public onlyRelayer {
        emit Modified(post, text);
    }

    event HiddenChanged(
      uint256 indexed post,
      bool hidden
    );

    function setHidden(
      uint256 post,
      bool hidden
    ) public onlyRelayer {
      emit HiddenChanged(post, hidden);
    }

    event NSFWChanged(
        uint256 indexed topic,
        bool nsfw
    );

    function setNSFW(
        uint256 topic,
        bool nsfw
    ) public onlyRelayer {
        emit NSFWChanged(topic, nsfw);
    }

    event LockChanged(
        uint256 indexed topic,
        bool locked
    );

    function setLocked(
        uint256 topic,
        bool locked
    ) public onlyRelayer {
        emit LockChanged(topic, locked);
    }

    event PinChanged(
        uint256 indexed topic,
        bool pinned
    );

    function setPinned(
        uint256 topic,
        bool pinned
    ) public onlyRelayer {
        emit PinChanged(topic, pinned);
    }

}
