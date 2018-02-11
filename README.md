# Solidity

# Basic Banking Smart Contract

*I take no credit for the code written. I am only learning and explaining information a step above the creators' instruction.

I've taken this basic banking smart contract written in solidity and annotated it with explanations. Some concepts are different than standard OOP. Condition-oriented programming ( part of contract oriented programming) removes the need for conditions in function bodies.

Couple of other things are interesting to note such as the TestThrow contract. Require validates user inputs and is used as a precursor. Assert really prevents an untrue thing from occuring




Learning Credit Goes To: http://bit.ly/2lJZ98x


# Ropsten TestNet Trial
*Disclaimer. This trial is taken exactly from the Udemy course: https://www.udemy.com/your-first-decentralized-app/.
I've simply executed the steps and explained them along the way.

Create a directory and run the following:

npm install -g ethereumjs-testrpc

testrpc

npm init

npm install ethereum/web3.js --save

This is for running on MetaMask test

npm install lite-server --save-dev


 Inside package.json...
  "scripts": {    
    "dev": "lite-server"
  },

  

npm run dev


# Rinkeby Testnet with Mist Browser.

Salary.sol; This is a simple salary contract. When an employee is included in the contracts list of workers they are allowed to get their salary (in this case ether). Once they received their payment, the contract does not allow further ether to be withdrawn. Code from: http://bit.ly/2DlePpt



# My first live erc-20 token on the Rinkeby Testnet

NTToken. Total supply 1000. Contract address: 0x4a8Bd51ED397954BBcB287dF3Eb7915F2a9D23c1
