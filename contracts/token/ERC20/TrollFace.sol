// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "./ERC20.sol";
import "./ERC20/extensions/ERC20Burnable.sol";
import "./ERC20/extensions/ERC20Pausable.sol";
import "../../access/Ownable.sol";
import "./ERC20/extensions/ERC20Permit.sol";

contract TROLLFACE is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("TROLLFACE", "TFC")
        Ownable(initialOwner)
        ERC20Permit("TROLLFACE")
    {
        _mint(msg.sender, 1000000000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
