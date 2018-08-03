pragma solidity ^0.4.24;

import "./CompoundNFT.sol";

contract CompoundNFTFactory {
    address internal entryTcr; 

    modifier isTcr {
        require(msg.sender == entryTcr);
        _;
    }

    constructor (address _entryTcr) public{
        entryTcr = _entryTcr;
    }

    function publishNFT() external isTcr returns(address newNft) {
        newNft = new CompoundNFT();
    }
}