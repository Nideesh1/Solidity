pragma solidity ^0.4.18;

contract Proof {
	
	struct FileDetails{
		uint timestamp;
		string owner;
	}

	mapping (string => FileDetails) files;

	event logFileAddedStatus(
	bool status,
	 uint timestamp,
	  string owner,
	   string fileHash
	);


	//this is used to store the owner of file at the block timestamp
	function set(string owner, string fileHash){

		if(files[fileHash].timestamp == 0){

				files[fileHash] = FileDetails(block.timestamp, owner);
		}

		else{
				logFileAddedStatus(true, block.timestamp, owner, fileHash);

		}
		
	}

	function get(string fileHash) returns (uint timestamp, string owner){

		return (files[fileHash].timestamp, files[fileHash].owner);
	
	}






}

