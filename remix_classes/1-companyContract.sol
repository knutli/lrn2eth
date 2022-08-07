// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Company{

    string public companyName;

    function setCompanyName(string memory _companyName) public {
        companyName = _companyName;
    }

    //struct creates a new data type
    //and in it, i define what it contains
    struct employees {
        string name;
        uint age;
        uint salary;
    }

    mapping(string => uint) public lookupSalary;
    mapping(string => uint) public lookupAge;
    
    //now i can make a new variable of type employees
    employees public CEO = employees({name: "Nassir", age: 33, salary: 1000000});

    //if i want to make a large list of ansatte i create arrays
    //within brackets you set array size. empty = infinite
    //define an array of type ansatte, and name it ansattArray
    employees[] public ansattArray;

    //now create a function to add people to array
    function addEmployee(string memory _name, uint _age, uint _salary) public{
        ansattArray.push(employees(_name, _age, _salary));
        //and a mapping so we can search our people later
        lookupSalary[_name] = _salary;
        lookupAge[_name] = _age;
    }

//the EVM stores data in stack, memory, storage, calldata, code and logs
//we cover memory, storage and calldata below

//in the above function, the nyAnsatt variable exists only in memory 
//to add a new employee to the array, and is then deleted
//memory is temporary MODIFIABLE variables
//calldata is temporary UNMODIFIABLE variables
//storage is permanent MODIFIABLE variables

//arrays, structs and mappings are special data types, and solidity needs to 
//be told where they are supposed to be saved. it already knows where uint 
//will be saved, so you dont need to specify for those
//a string is secretly/behind the scenes an array

    //i want to be able to search my array by names
    //for this we use mapping, which is basically a dictionary
    //for this, see line 15

}