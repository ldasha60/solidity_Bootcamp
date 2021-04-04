// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MappingsStructExample {
    
    mapping(address => uint) public balanceRecieved;
    
    function getBalance() public view returns(uint){
        return address(this).balance;
        
    }
    
    function sendMoney() public payable{
        balanceRecieved[msg.sender] += msg.value;
        
    }
    
    function withdrawAllMoney(address payable _to) public payable {
        uint balanceToSend = balanceRecieved[msg.sender];
        balanceRecieved[msg.sender] = 0;
        
        _to.transfer(balanceToSend);
    }
}

