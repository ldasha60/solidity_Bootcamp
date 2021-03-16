pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    address public owner;
    bool public paused;
    
    constructor(){
        owner = msg.sender;
    }
    
    function setPaused(bool _paused) public{
        require(owner == msg.sender, "You are not the owner.");
        paused = _paused;
    }
    
    function sendMoney() public payable{
        
    }
    
    function withdrawAllMoney(address payable _to) public{
        require(owner == msg.sender, "You cannot withdraw.");
        require(paused == false, "Contract Paused");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public{
        require(owner == msg.sender, "You are not the owner.");
        selfdestruct(_to);
    }
}