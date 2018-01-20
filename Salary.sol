pragma solidity ^0.4.18;

contract Salary {
    
        address[] employees = [
            0xaCA5F5fA0512f9481EDf6455EC8A1E3DC5e274D6,
            0xCb83Fd2e357dC3Aa9770f8F708c42CE75A3Fc0Ba
            ];
            
            
        mapping (address => uint) withdrawnAmounts;

        uint totalReceived = 0;

	    
	    function Salary() payable{
	        updateTotalReceived();
	        
	    }
	    
	    
	    //this is the fallback function
	    function () payable{
	        updateTotalReceived();
	    }
	    
	    function updateTotalReceived() internal {
	        totalReceived += msg.value;
	    }
	    
	    
	    modifier canWithdraw(){
	        
	        bool contains = false;
	        
	        for(uint i =0; i < employees.length; i++){
	            if(employees[i] == msg.sender){
	                
	                contains = true;
	            }
	            
	        }
	        
	        require(contains);
	        _;
	        
	    }
	    
	    
	    //withdraw function
	    function withdraw() canWithdraw{
	        
	        uint amountAllocated = totalReceived/employees.length;
	        uint amontWithdrawn = withdrawnAmounts[msg.sender];
	        uint amount = amountAllocated - amontWithdrawn;
	        
	        withdrawnAmounts[msg.sender] = amontWithdrawn + amount;
	        
	        if(amount > 0){
	            msg.sender.transfer(amount);
	        }
	    }




	    
	

}

