// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Profiles is Relayable {

  event Nickname(
    address indexed id,
    string nickname
  );

  function setNickname(
    address id,
    string calldata nickname
  ) public onlyRelayer {
    emit Nickname(id, nickname);
  }

  event Avatar(
    address indexed id,
    string avatar
  );

  function setAvatar(
    address id,
    string calldata avatar
  ) public onlyRelayer {
    emit Avatar(id, avatar);
  }

  event Description(
    address indexed id,
    string description
  );

  function setDescription(
    address id,
    string memory description
  ) public onlyRelayer {
    emit Description(id, description);
  }
  
}
