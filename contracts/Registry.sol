// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import './OpenZeppelin_v5_0_0/openzeppelin-contracts/contracts/access/Ownable.sol';

/**
 * @title OtomicMarket
 * @dev OtomicMarket logic
 */
contract Registry is Ownable {
    
    
    struct Node {
        string name;
        string description;
        string url;
        bool status;
    }

    mapping (address => Node) contractList;
    
    /**
    * @dev Initialize Registry necessary parameters.
    */
    constructor() Ownable(msg.sender){
    } 

    modifier  onlyOwnerOrCreator(address sender, address nodeAddress) {
        require(sender == owner() || sender == nodeAddress, "Only node creator or owner can call it.");
        _;
    }

    /**
    * @dev Query Node information.
    * @param nodeAddress The address of this node. 
    */

    function queryNode(address nodeAddress) public view returns (Node memory) {
        return contractList[nodeAddress];
    } 

    /**
    * @dev Update exist node. 
    */
    function updateNode(address nodeAddress, string calldata name, string calldata description, string calldata url, bool status) 
    public
    onlyOwnerOrCreator(msg.sender, nodeAddress) {
        contractList[nodeAddress].name = name;
        contractList[nodeAddress].description = description;
        contractList[nodeAddress].url = url;
        contractList[nodeAddress].status = status;
    }

}