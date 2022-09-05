//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./priceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 5 * 1e18; //1 * 10 ** 18

    address[] public funders;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function howManyFunders() public view returns (uint256) {
        return funders.length;
    }

    function sumOfFunds() public view returns (uint256) {
        return address(this).balance;
    }

    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        //Want to be able to set a minimum funding amount in USD
        //1. How do we send ETH to this contract? we set it to payable
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "not enuf vespene gas"
        ); // 1e18 == 1 * 10 ** 18 == 1 000 000 000 000 000 000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        //this require function is kind of like a checkpoint
        //it checks to see if condition is met and if yes carries it out. if its not met, it reverts, and sends back any gas used up until require
        //anything after the checkpoint will still try to run
        //in our 4_PriceConverter.sol that we import we find getConversionRate, which takes a uint256 ethAmount as input
        //by adding the keyword "using" we could give any uint within the FundMe contract the libraries functions and pass the uint as the first parameter of that function.
        //msg.value acts as the ethAmount in the getConversionRate function (the first argument). if the getConversionRate had several arguments, you would need to pass more in the require statement
    }

    //mission: withdraw all assets from the contract, and loop through the funders array mapping and set each funders amount back down to zero upon withdrawal
    function withdraw() public onlyOwner {
        // for (starting value; ending value; step)
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        funders = new address[](0);

        //actually withdraw funds; there are three ways:
        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //msg.sender = address
        //payable(msg.sender) = payable address, which is needed in solidity to send native currency (ETH)
        //transfer is capped at 2300 gas, throws error if it fails

        //send
        bool successfulSend = payable(msg.sender).send(address(this).balance);
        require(successfulSend, "Send failed!");
        //

        //call
        //payable(msg.sender).call("");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }

    //What if people sends ETH to this contract without calling the fund function? What happens then?
    //This is where fallback() and receive() comes in

    //receive is for when people accidently sends money, we can still process the tx.
    //if the msg.data is empty, we need to specify some default options for the contract
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
