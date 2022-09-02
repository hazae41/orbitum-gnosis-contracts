pragma solidity >=0.8.7;

// SPDX-License-Identifier: MIT

contract Profiles {
  address relayer;

  constructor() {
    relayer = msg.sender;
  }

  function transfer(address relayer2) public {
    require(msg.sender == relayer, "Not relayer");

    relayer = relayer2;
  }

  event Nickname(
    address indexed id,
    string nickname
  );

  function setNickname(
    address id,
    string calldata nickname
  ) public {
    require(msg.sender == relayer, "Not relayer");

    emit Nickname(id, nickname);
  }

  event Avatar(
    address indexed id,
    string avatar
  );

  function setAvatar(
    address id,
    string calldata avatar
  ) public {
    require(msg.sender == relayer, "Not relayer");

    emit Avatar(id, avatar);
  }

  event Description(
    address indexed id,
    string description
  );

  function setDescription(
    address id,
    string memory description
  ) public {
    require(msg.sender == relayer, "Not relayer");

    emit Description(id, description);
  }
}
