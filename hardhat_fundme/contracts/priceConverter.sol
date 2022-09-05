//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//this contract is gonna be a library we attach to uint256
//we import most of the stuff we wrote for FundMe.sol
//all public funtions need to be changed to internal
//in our FundMe contract, we now import this contract, and attach it to uint256 (see FundMe.sol)

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    //need the ETH/USD price
    function getPrice(AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint256)
    {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        //this gives us ETH in terms of USD
        //remember that this gives us a number with many decimals, 8 to be exact
        //need to convert to 18 decimals
        return uint256(price * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }
}
