const networkConfig = {
    // Chain ID Goerli = 4
    4: {
        name: "goerli",
        ethUsdPriceFeed: "0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e",
    },

    // Chain ID Polygon = 137
    137: {
        name: "polygon",
        ethUsdPriceFeed: "0xF9680D99D6C9589e2a93a78A04A279e509205945",
    },

    //31337 hardhat
}

const developmentChains = ("hardhat", "localhost")
const DECIMALS = 8
const INITIAL_ANSWER = 200000000000

// Understand what module.exports does in this link:
// https://www.sitepoint.com/understanding-module-exports-exports-node-js/
// Basically, we want to make it available other places outside this file...
module.exports = {
    networkConfig,
    developmentChains,
    DECIMALS,
    INITIAL_ANSWER,
}
