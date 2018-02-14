pragma solidity ^0.4.18;

//This contract is to test inheritance in addition to constructor contract creation
//which demands a parameter in the Mist Browser itself

// Contract Address : 0x3e644e79663514a52A33c4BBcE9875D039C86B55

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
