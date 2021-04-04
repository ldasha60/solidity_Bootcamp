// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.11 <0.7.0;

contract MappingsStructExample {
    
    struct Payment {
    uint amount;
    uint timestamp;
    }
    
    struct Balance {
    uint totalBalance;
    uint numPayments;
    
    mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceReceived;
    
    function getBalance() public view returns(uint){
        return address(this).balance;
        
    }
    
    function sendMoney() public payable{
        balanceReceived[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value, now);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
        balanceReceived[msg.sender].numPayments++;
        
    }
    
    function withdrawAllMoney(address payable _to) public payable {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        
        _to.transfer(balanceToSend);
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
    }
}


