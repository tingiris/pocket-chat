pragma solidity ^0.4.15;


contract MessageContract {

    mapping (address => text[] ) public mytext;
  
  
    mapping (uint => address) public addressIndex;
    uint public addressCount;
    
    struct Text {
        address toAddress;
        string message;
    }
    
    function  iteratetext() public {
        for(uint i=0;i<addressCount;i++) {
        mytext[addressIndex[i]];
    }
}

/*
TODO ADD ABI

TODO ADD Contract Address
*/
