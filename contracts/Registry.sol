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
        bool availability;
        address creator;
    }

    mapping (address => Node) contractList;
    
    /**
    * @dev Initialize Registry necessary parameters.
    */
    constructor() Ownable(msg.sender){
    } 

    modifier  onlyOwnerOrCreator(address sender, address nodeAddress) {
        require(sender == owner() || sender == contractList[nodeAddress].creator, "Only node creator or owner can call it.");
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
    * @dev Create new node. 
    */
    function createNode(address nodeAddress, string calldata name, string calldata description, string calldata url, bool availability) public {
        _updateNode(nodeAddress, name, description, url, availability, msg.sender);
    }


    /**
    * @dev Update exist node. 
    */
    function updateNode(address nodeAddress, string calldata name, string calldata description, string calldata url, bool availability) 
    public
    onlyOwnerOrCreator(msg.sender, nodeAddress) {
        address creator = contractList[nodeAddress].creator;
        _updateNode(nodeAddress, name, description, url, availability, creator);
    }

    /**
    * @dev Modify node list. 
    */
    function _updateNode(address nodeAddress, string calldata name, string calldata description, string calldata url, bool availability, address creator) 
    private 
    {
        contractList[nodeAddress].name = name;
        contractList[nodeAddress].description = description;
        contractList[nodeAddress].url = url;
        contractList[nodeAddress].availability = availability;
        contractList[nodeAddress].creator = creator;
    }

}