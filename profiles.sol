// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Profiles is Relayable {

    event NicknameChanged(
        address indexed id,
        string nickname
    );

    function setNickname(
        address id,
        string calldata nickname
    ) public onlyRelayer {
        emit NicknameChanged(id, nickname);
    }

    event AvatarChanged(
        address indexed id,
        string avatar
    );

    function setAvatar(
        address id,
        string calldata avatar
    ) public onlyRelayer {
        emit AvatarChanged(id, avatar);
    }

    event DescriptionChanged(
        address indexed id,
        string description
    );

    function setDescription(
        address id,
        string memory description
    ) public onlyRelayer {
        emit DescriptionChanged(id, description);
    }
    
    event BadgedChanged(
      address indexed id,
      bool badged
    );
  
    function setBadged(
      address id,
      bool badged
    ) public onlyRelayer {
        emit BadgedChanged(id, badged);
    }

    event RandomChanged(
      address indexed id,
      bool random
    );
  
    function setRandom(
      address id,
      bool random
    ) public onlyRelayer {
        emit RandomChanged(id, random);
    }
}
