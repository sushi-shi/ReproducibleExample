// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;


import "ERC20/IERC20.sol";
import "ERC20/SafeERC20.sol";

contract StakingPool {
    using SafeMath for uint64;
    using SafeERC20 for IERC20;

    IERC20 private _stakingToken;

    constructor(
        IERC20 stakingToken_
    ) public {
        _stakingToken = stakingToken_;
    }

    function claim(uint64 amount)
        external
    {
        address caller = msg.sender;
        _stakingToken.safeTransferFrom(caller, caller, amount);
        // _stakingToken.safeTransferFrom(caller, address(this), amount);
    }

}
