// AgroHarvestToken.sol
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract AgroHarvestToken is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    uint256 public totalSupplyCap;
    address public propertyManager;

    mapping(address => bool) private holdersMap;
    address[] private holdersArray;

    event RentDistributed(uint256 totalAmount, uint256 timestamp);

    function initialize(
        address _propertyManager,
        address initialOwner,
        uint256 _totalSupplyCap
    ) public initializer {
        __ERC20_init("Agro Harvest Token", "AHT");
        __Ownable_init_unchained(initialOwner);
        totalSupplyCap = _totalSupplyCap;
        propertyManager = _propertyManager;
        transferOwnership(initialOwner);
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= totalSupplyCap, "Total supply cap exceeded");
        _mint(to, amount);
        _addHolder(to);
    }

    function distributeRent() public payable {
        require(msg.sender == propertyManager, "Only property manager can distribute rent");
        require(totalSupply() > 0, "No tokens minted");

        uint256 rentPerToken = msg.value / totalSupply();

        address[] memory holders = _getHolders();
        for (uint256 i = 0; i < holders.length; i++) {
            uint256 tokenBalance = balanceOf(holders[i]);
            uint256 payment = rentPerToken * tokenBalance;
            (bool success, ) = holders[i].call{value: payment}("");
            require(success, "Payment failed");
        }

        emit RentDistributed(msg.value, block.timestamp);
    }

    function _getHolders() internal view returns (address[] memory) {
        return holdersArray;
    }

    function _addHolder(address holder) internal {
        if (!holdersMap[holder]) {
            holdersMap[holder] = true;
            holdersArray.push(holder);
        }
    }

    function _removeHolder(address holder) internal {
        if (holdersMap[holder]) {
            holdersMap[holder] = false;
        }
    }

    receive() external payable {
        distributeRent();
    }
}
