pragma solidity ^0.4.18;

//This contract is to test inheritance in addition to constructor contract creation
//which demands a parameter in the Mist Browser itself

contract Person {
	
	address public owner;

	function person() public{

		owner = msg.sender;
	}

	function kill() public{ 

		selfdestruct(owner);

	}

}

contract Student is Person {
	
	string public userName;

	function Student(string _name) public {

		userName = _name;
	}

}

contract Teacher is Person {
	
	string public userName;

	function Teacher(string _name) public {

		userName = _name;
	}

}
