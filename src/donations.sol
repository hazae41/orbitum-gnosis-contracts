// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./relayable.sol";

contract Donations is Relayable {

    event Donated(
        string txHash,
        uint256 indexed post,
        address indexed donator,
        uint256 amount
    );

    function donate(
      string calldata txHash,
      address donator,
      uint256 post,
      uint256 amount
    ) public onlyRelayer {
      emit Donated(txHash, post, donator, amount);
    }

}
