//
//  Data.swift
//  iosExample
//
//  Created by jeremy beal on 3/18/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import Foundation
import BigInt


class Data {

    let publicID = UserDefaults.standard.data(forKey: "publicKey")
    
    func contractData(userInput: String){
    
        let contractAddress = "0x1127AB2eF75626c24aACf1676FfcE108aFa774bF"
    
        let functionABI = "[{\"constant\":false,\"inputs\":[{\"name\":\"_toAddress\",\"type\":\"address\"},{\"name\":\"_toText\",\"type\":\"string\"}],\"name\":\"appendText\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[],\"name\":\"iteratetext\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"_toAddress\",\"type\":\"address\"}],\"name\":\"readMessage\",\"outputs\":[{\"name\":\"messageInfo\",\"type\":\"bytes32[]\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"}]"
    
        
        
    
        let contractParams = [
        "function": "appendText",
        "Data":userInput
            ] as [AnyHashable:Any]

        let txParams = [
            "from": publicID!,
            "nonce": BigUInt.init(0),
            "to": contractAddress,
            "value": BigUInt.init(0),
            "gasLimit": BigUInt.init(2000000),
            "gasPrice": BigUInt.init(1000000000),
            "data": [
                "abi": functionABI,
                "params": contractParams
                ] as [AnyHashable: Any]
            ] as [AnyHashable: Any]
    
   }
    
    
    
}


/*
 address = 0x1127AB2eF75626c24aACf1676FfcE108aFa774bF
 
 // Contract
 pragma solidity >=0.5.0;
 
 contract notsoSneakyMessages{
 
 mapping (address => text[]) mytext;
 mapping (uint => address) addressIndex;
 uint addressCount;
 
 
 struct text {
 address toAddress;
 string message;
 }
 
 function  iteratetext() public{
 for(uint i=0;i<addressCount;i++)
 {
 mytext[addressIndex[i]];
 }
 }
 
 function  appendText(address _toAddress, string memory _toText) public {
 text memory messageInfo = text(_toAddress, _toText);
 mytext[_toAddress].push(messageInfo);
 }
 
 function readMessage(address _toAddress)public view returns(bytes32[] memory messageInfo) {
 
 uint length = mytext[_toAddress].length;
 messageInfo = new bytes32[](length);
 
 for(uint i = 0; i < length; i++)
 {
 messageInfo[i] = stringToBytes32(mytext[_toAddress][i].message);
 }
 //return  text[msg.sender];
 }
 
 function stringToBytes32(string memory source) private pure returns (bytes32 result) {
 bytes memory tempEmptyStringTest = bytes(source);
 if (tempEmptyStringTest.length == 0) {
 return 0x0;
 }
 
 assembly {
 result := mload(add(source, 32))
 }
 }
 
 }
 
 ////////// ABI
 [
 {
 "constant": false,
 "inputs": [
 {
 "name": "_toAddress",
 "type": "address"
 },
 {
 "name": "_toText",
 "type": "string"
 }
 ],
 "name": "appendText",
 "outputs": [],
 "payable": false,
 "stateMutability": "nonpayable",
 "type": "function"
 },
 {
 "constant": false,
 "inputs": [],
 "name": "iteratetext",
 "outputs": [],
 "payable": false,
 "stateMutability": "nonpayable",
 "type": "function"
 },
 {
 "constant": true,
 "inputs": [
 {
 "name": "_toAddress",
 "type": "address"
 }
 ],
 "name": "readMessage",
 "outputs": [
 {
 "name": "messageInfo",
 "type": "bytes32[]"
 }
 ],
 "payable": false,
 "stateMutability": "view",
 "type": "function"
 }
 ]
 
 
 
 */
