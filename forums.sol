// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Forums is Relayable {

    event AvatarChanged(
        string name,
        string avatar
    );

    function setAvatar(
        string calldata name,
        string calldata avatar
    ) public onlyRelayer {
        emit AvatarChanged(name, avatar);
    }

    event DescriptionChanged(
        string name,
        string description
    );

    function setDescription(
        string calldata name,
        string memory description
    ) public onlyRelayer {
        emit DescriptionChanged(name, description);
    }

    event NSFWChanged(
        string name,
        bool nsfw
    );

    function setNSFW(
        string calldata name,
        bool nsfw
    ) public onlyRelayer {
        emit NSFWChanged(name, nsfw);
    }

    event OwnershipChanged(
        string name,
        address indexed owner
    );

    function setOwner(
        string calldata name,
        address owner
    ) public onlyRelayer {
        emit OwnershipChanged(name, owner);
    }

    event ModeratorPromoted(
        string name,
        address indexed moderator
    );

    function promote(
        string calldata name,
        address moderator
    ) public onlyRelayer {
        emit ModeratorPromoted(name, moderator);
    }

    event ModeratorUnpromoted(
        string name,
        address indexed moderator
    );

    function unpromote(
        string calldata name,
        address moderator
    ) public onlyRelayer {
        emit ModeratorUnpromoted(name, moderator);
    }

}
