
pragma solidity ^0.8.2;

contract WorkingWithVars{
    uint256 public myUint;
    
    function setMyUnit(uint256 _myUnit) public{
        myUint = _myUnit;
    }
    
    bool public myBool;
    
    function setMyBool(bool _myBool) public{
        myBool = _myBool;
    }
    
    uint8 public myUint8;
    
    function decrementUint() public{
        myUint8--;
    }
    
    function incrementUint() public{
        myUint8++;
    }
    
    address public myAddress;
    
    function setAddress(address _myAddress) public{
        myAddress = _myAddress;
    }
    
    function getBalanceOfAddress() public view returns (uint){
        return myAddress.balance;
    }
    
    string public myString;
    
    function setString(string memory _myString) public{
        myString = _myString;
    }
}