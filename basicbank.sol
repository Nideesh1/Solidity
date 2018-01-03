pragma solidity ^0.4.0;


//An interface delcaration allows someone to upgrade
interface Regulator{
    
    //someone can check if that amount exists or not
    function checkValue(uint amount) returns (bool);
    
    //tells you if a loan is allowed
    function loan() returns (bool);
}


contract Bank is Regulator{
    
    //private because we don't want others to know
    uint private value;
    
    //We want to protect the identity of the owner. Identity is address
    address private owner;
    
    
    
    modifier ownerFunc {
        
        //Handling a potential error in case the person 
        //sending the message is not the owner.
        require(owner == msg.sender);
        
        //This is something known as condition oriented programming.
        //If a function  calls this, that function will be protected
        //by the previous require line
        _;
    }
    
    
    function Bank(uint amount){
        
        
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) ownerFunc{
        value += amount;
        
    }
    
    function withdraw(uint amount) ownerFunc{
        if(checkValue(amount)){
        value -= amount;
        }
    }
    
    function balance() returns (uint){
        return value;
    }
    
    function checkValue(uint amount) returns (bool) {
        return amount >= value;
    }
    
    function loan() returns (bool){
        return value > 0;
    }
    
}

contract MyFirstContract is Bank(10) {


    //We do not want to reveal our name and age to outsiders
    string private name;
    uint private age;
    
    
    function setName (string newName) public {
       
        name = newName;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge (uint newAge) public {
        age = newAge;
    }
    
    function getAge() returns (uint) {
        return age;
    }
    
    
    function loan() returns (bool){
        
        return true;
    }
}

//This is an interesting difference to traditional errors. 
//This first one is black box yes or no,
contract TestThrows {
    
    //All your gas is gone if you make a mistake
    function testAssert(){
        assert(false);
        
    }
    
    function tesetRequire(){
        require(2 ==3);
        
    }
    
    //This will give you some gas back!
    function testRevert(){
        revert();
    }
    
    function testThrow(){
        throw;
    }
}
