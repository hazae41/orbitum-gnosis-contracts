// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Forums is Relayable {

    event Avatar(
        string name,
        string avatar
    );

    function setAvatar(
        string calldata name,
        string calldata avatar
    ) public onlyRelayer {
        emit Avatar(name, avatar);
    }

    event Description(
        string name,
        string description
    );

    function setDescription(
        string calldata name,
        string memory description
    ) public onlyRelayer {
        emit Description(name, description);
    }

    event NSFW(
        string name,
        bool nsfw
    );

    function setNSFW(
        string calldata name,
        bool nsfw
    ) public onlyRelayer {
        emit NSFW(name, nsfw);
    }

    event Ownership(
        string name,
        address indexed owner
    );

    function setOwner(
        string calldata name,
        address owner
    ) public onlyRelayer {
        emit Ownership(name, owner);
    }

    event Promoted(
        string name,
        address indexed moderator
    );

    function promote(
        string calldata name,
        address moderator
    ) public onlyRelayer {
        emit Promoted(name, moderator);
    }

    event Unpromoted(
        string name,
        address indexed moderator
    );

    function unpromote(
        string calldata name,
        address moderator
    ) public onlyRelayer {
        emit Unpromoted(name, moderator);
    }

}
