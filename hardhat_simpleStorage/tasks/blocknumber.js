// The point of this task is to find and print the
// current block number we're working in

const { task } = require("hardhat/config")

task("blocknumber", "Print current block number").setAction(
    async (taskArgs, hre) => {
        const blockNumber = await hre.ethers.provider.getBlockNumber()
        console.log(`Current block number: ${blockNumber}`)
    }
)
