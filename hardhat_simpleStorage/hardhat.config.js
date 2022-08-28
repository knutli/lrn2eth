require("@nomicfoundation/hardhat-toolbox")
require("dotenv").config()
require("@nomiclabs/hardhat-etherscan")
require("./tasks/blocknumber")
require("hardhat-gas-reporter")

/** @type import('hardhat/config').HardhatUserConfig */

// remember that to pull in .env stuff you need to import the dotenv package
const RINKEBY_RPC_URL = process.env.RINKEBY_RPC_URL
const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL
const KOVAN_RPC_URL = process.env.KOVAN_RPC_URL
const GANACHE_RPC_URL = process.env.GANACHE_RPC_URL
const RINKEBY_PRIVATE_KEY = process.env.RINKEBY_PRIVATE_KEY
const GOERLI_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY
const KOVAN_PRIVATE_KEY = process.env.KOVAN_PRIVATE_KEY
const GANACHE_PRIVATE_KEY = process.env.GANACHE_PRIVATE_KEY
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY
const CMC_API_KEY = process.env.CMC_API_KEY

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        rinkeby: {
            url: RINKEBY_RPC_URL,
            accounts: [RINKEBY_PRIVATE_KEY],
            chainId: 4,
        },

        localhost: {
            url: "http://127.0.0.1:8545/",
            chainId: 31337,
        },

        goerli: {
            url: GOERLI_RPC_URL,
            accounts: [GOERLI_PRIVATE_KEY],
            chainId: 5,
        },

        kovan: {
            url: KOVAN_RPC_URL,
            accounts: [KOVAN_PRIVATE_KEY],
            chainId: 42,
        },

        ganache: {
            url: GANACHE_RPC_URL,
            accounts: [GANACHE_PRIVATE_KEY],
            chainId: 1337,
        },
    },

    etherscan: {
        apiKey: ETHERSCAN_API_KEY,
    },

    solidity: "0.8.15",

    gasReporter: {
        enabled: false,
        outputFile: "gas-report.txt",
        noColors: true,
        currency: "USD",
        coinmarketcap: CMC_API_KEY,
        //token: "MATIC"
    },
}
