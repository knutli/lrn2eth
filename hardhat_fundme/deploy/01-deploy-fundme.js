const { getNamedAccounts, deployments } = require("hardhat")

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
module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId
}
