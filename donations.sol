// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Donations is Relayable {

    event Donated(
        uint256 indexed post,
        address indexed donator,
        uint256 amount
    );

    function donate(
      address donator,
      uint256 post,
      uint256 amount
    ) public onlyRelayer {
      emit Donated(post, donator, amount);
    }

}
