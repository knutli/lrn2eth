//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//we want to create a contract that deploys another contract
//in our case, the company employee contract

import "./1-companyContract.sol";

contract createCompany{
    //importing the contract and assigning it to a variable.
    //notice above i import the .sol FILE
    //but below I assign the Company CONTRACT to a new variable
    //think of the contract as a type
    //and lastly i make it an array
    Company[] public companyArray;

    //now make a function that creates a new company in my array each time it's called
    function createNewCompanyContract() public {
        Company company = new Company();
        companyArray.push(company);
    }

    //now we wanna use functions from my CompanyEmployees.sol contract
    //for it, we need the contract's address and ABI, which is imported 
    //let's use the addEmployee function from the other contract
    function CC_addEmployee(uint256 _companyNumber, string memory _name, uint _age, uint _salary) public {
        Company company = companyArray[_companyNumber];
        company.addEmployee(_name, _age, _salary);
    }

    //FIX THIS TOMORROW!!
    function CC_checkSalary(uint _companyNumber) public view returns (uint){
        Company company = companyArray[_companyNumber];
        return company.lookupSalary;
    }
}