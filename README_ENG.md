# Agro Harvest Token (AHT)

## Project Goals

Agro Harvest Token (AHT) is a blockchain application designed for the agriculture sector. This project aims to provide a revenue distribution system for farmers and investors, track the movement of agricultural products, enhance transparency, raise capital without intermediaries, and distribute profits.

## Key Features

- **Token Creation:** Create limited supply unique tokens for agricultural land and fields.
- **Revenue Distribution:** Distribute periodic/annual ROI income shares to token holders based on their token percentage.
- **Transparency and Traceability:** Track agricultural activities and accounts on the blockchain.

## Smart Contract Functions

1. **initialize**  
   Used to initialize the smart contract.  
   `function initialize(address _propertyManager, address initialOwner, uint256 _totalSupplyCap) public initializer;`

2. **mintTokens**  
   Used to create new tokens.  
   `function mintTokens(address to, uint256 amount) public onlyOwner;`

3. **distributeRent**  
   Used to perform revenue distribution.  
   `function distributeRent() public payable;`

4. **receive**  
   Used to make payments to the contract.  
   `receive() external payable;`

## Requirements

- Node.js
- Solidity
-Remix
![image](https://github.com/user-attachments/assets/30b678c5-8dd6-46fe-a8e9-16019f58351d)

## Deployment Information

Smart contract deployment address: [0x67EF874B655E62Fd27A555E78096348AD6254710](https://sepolia.scrollscan.com/address/0x67EF874B655E62Fd27A555E78096348AD6254710)

