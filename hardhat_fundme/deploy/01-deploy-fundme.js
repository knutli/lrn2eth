const { getNamedAccounts, deployments, network } = require("hardhat")

/* Could do it like this: 

function deployFunc(hre) {
    console.log("Hi!")
}
module.exports.default = deployFunc


But we're doing something differently:

module.exports = async (hre) => {
// This is an async nameless function
// hre is the hardhat runtime environment
// from hre, we get two variables, getNamedAccounts and deployments
    const { getNamedAccounts, deployments } = hre
}


This can be made even shorter by swapping out hre by the variables we're getting:
*/

const { networkConfig } = require("../helper-hardhat-config")
// Note that the syntax in the above line is the same as
// const helperConfig = require("../helper-hardhat.config")
// const networkConfig = helperConfig.networkConfig

module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    const ethUsdPriceFeedAddress = networkConfig[chainId]["ethUsdPriceFeed"]

    // when using localhost or hardhat we want to use a mock
    // what happens if we want to change chains?

    const fundMe = await deploy("FundMe", {
        from: deployer,
        args: [ethUsdPriceFeedAddress],
        log: true,
    })
}
