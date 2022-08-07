//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//this contract is gonna be a library we attach to uint256
//we import most of the stuff we wrote for FundMe.sol
//all public funtions need to be changed to internal
//in our FundMe contract, we now import this contract, and attach it to uint256 (see FundMe.sol)

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    //need the ETH/USD price
    function getPrice() internal view returns (uint256) {
        // we have to interact with a contract outside our project, so need contract ABI and address
        // address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        // ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //this gives us ETH in terms of USD
        //remember that this gives us a number with many decimals, 8 to be exact
        //need to convert to 18 decimals
        return uint256(price * 1e10);
    }

    function getVersion() internal view returns (uint256){
        AggregatorV3Interface thisIsChainlinkDude = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        //now ive imported the ABI and address with the stuff after the = sign
        //i can now use functions within the external contract
        return thisIsChainlinkDude.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }

 }