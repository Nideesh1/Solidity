pragma solidity ^0.4.18;

contract Owned {
    
    address owner;
    
    
    //This ensures that only the person who calls the message is
    //considered the owner
    function Owned() public {
        owner = msg.sender;
    }
    
    //Unlike traditional term 'modifier', in Solidity we can create a custome
    //'if' statement condition that checks to see if a condition is met 
    //before running the remainder of the function. A function calling the
    //modifer will only run if the modifiers conditions are met.
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}


contract Courses is Owned {
    struct Instructor{
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    
    mapping (address => Instructor) instructors;
    
    
    event instructorInfo(
        bytes16 fName,
        bytes16 lName,
        uint age
        
    );
    
    
    address[] public instructorAccts;
    
    function setInstructor(address _address, uint _age, bytes16 _fName, 
    bytes16 _lName) onlyOwner public
    {
        var instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        instructorAccts.push(_address) - 1;
        
    }
    
    function getInstructors() view public returns(address[]){
        return instructorAccts;
    }
    
    function getInstructor(address _address) view public returns(uint, 
    bytes16, bytes16){
        return (instructors[_address].age, instructors[_address].fName
        , instructors[_address].lName);
    }
    
    
    function countInstructors() view public returns (uint){
        return instructorAccts.length;
    }
    
}
