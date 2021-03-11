// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

contract SendMoneyExample{
    
    uint public balanceRecieved;
    uint public lockedUntil;
    
    function recieveMoney() public payable {
        balanceRecieved += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }
    
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    
    
    //This function will send all funds stored in the Smart Contract to the function caller
    function withdrawMoney() public {
        if (lockedUntil < block.timestamp){
        address payable to = payable(msg.sender);
        to.transfer(getBalance());    
        }
    }
    
    //the Funds can be send to a specific Account.
    function withdrawMoneyTo(address payable _to) public {
        if (lockedUntil < block.timestamp){
         _to.transfer(getBalance());  
        }
    }
    
}