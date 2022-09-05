# lrn2eth

**My learning journey, from zero experience with coding, to becoming a Solidity whiz kid**

**Current timestamp in [Patrick's](https://www.youtube.com/watch?v=gyMwXuJrbJQ&t=22291s) course: 09:47:05**

# Table of content:

1. [Data types](https://github.com/knutli/lrn2eth/blob/main/README.md#data-types)
2. [Storing data](https://github.com/knutli/lrn2eth/blob/main/README.md#storing-data)
3. [Syntax structure](https://github.com/knutli/lrn2eth/blob/main/README.md#syntax-structure)
4. [Libraries](https://github.com/knutli/lrn2eth/blob/main/README.md#libraries)
5. [Special functions and global functions](https://github.com/knutli/lrn2eth/blob/main/README.md#special-functions)
6. [Composability and Chainlink stuff](https://github.com/knutli/lrn2eth/blob/main/README.md#composability)
7. [Gas optimization](https://github.com/knutli/lrn2eth/blob/main/README.md#gas-optimization-stuff)
8. [Debugging](https://github.com/knutli/lrn2eth/blob/main/README.md#debugging-errors)
9. [Exciting resources](https://github.com/knutli/lrn2eth/blob/main/README.md#exciting-resources)

# Introduction and basics

## Basic data types

- Types and variables
  - uint, uint8, uint256, int, int8, int256, bool, string, address
- array[] (if you set an array, you can either define its size like array[3] or leave it like array[] for it to be infinitely long
- struct{} (define a new data type, and in it, I define what it contains)
- mapping(data type => data type)

Arrays, structs and mappings are special data types, and solidity needs to be told where they are supposed to be saved -> memory, storage or calldata. It already knows where uint will be saved, so you dont need to specify for those. A string is secretly/behind the scenes an array.

## Storing data

- The EVM stores data in stack, memory, storage, calldata, code and logs
- memory is temporary MODIFIABLE variables, for example when you want to assign a value to a variable (e.g. within a function), and then delete the variable once the function has run
- Calldata is temporary UNMODIFIABLE variables
- Storage is permanent MODIFIABLE variables (on the blockchain)

## Syntax structure

- Data type
- Name
- Visibility (public, private, external, internal)
- Payability (if yes, add payable flag)

## Libraries

- A library is like a contract, except it cannot send ether and it cannot declare state variables
- Instead of doing "contract contractName {}", you do "library libraryName {}" and import it like you would any other contract
- In the library you probably have functions, like function add()
- Once the library is imported into a contract, you can write "using libraryName for uint"
- by adding the keyword _using_ we could give any uint within the contract the libraries functions and pass the uint as the first parameter of that function, e.g. x.add(123)

## Special functions

- A **constructor** is a function that is automatically called when the contract is published. A classic usecase is to set the owner of the contract to msg.sender.
- A **modifier** is basically writing a piece of code and attach it to a keyword. This keyword is then placed along with other functions' stuff, like public view +++. See the fundMe example, and the onlyOwner modifier.
- A **receive()** method is used as a fallback function in a contract and is called when ether is sent to a contract with no calldata. If the receive method does not exist, it will use the fallback function. The receive function cannot have arguments, cannot return anything and must have external visibility and payable state mutability.
- A **fallback()** method is called if the receive function doesn't exist. fallback() external payable — when no other function matches (not even the receive function). Optionally payable.

### Global function things

- msg.value (how many wei was sent with the message)
- msg.sender (address of the sender of the message)

## Composability

- A smart contract can be imported into another smart contract and given a name
- When interacting with a contract outside our own project we need its contract address and its ABI
- Import another contract with "import @PATH". Stick it at the top of your contract
- An "interface" is kinda like a recipe to get the content of the ABI. For example
  import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
- Then do
  AggregatorV3Interface linkVar = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
  and you can now use the contract's functions!
- return linkVar.version(); //version() is a function from the external contract! Cool!

### Chainlink out of the box stuff

- Data feeds connect us to the real world
- Randomness function gives us provable random numbers, which we can't get on ETH because determinism
- Keepers are decentralized, event-driven computation. If trigger => do this. We can set both trigger and reaction
- API calls with oracle nodes

## Gas optimization stuff

- _constant_ and _immutable_ are great keywords to use if you're only setting your variables once. They are keywords that write variables directly into the bytecode of the contract instead of into its storage, making it easier to read, and therefore more gas efficient. Naming convention for constants is ALL_CAPS, while immutable is i_variable.
- Constants can be set once, and only once.
- Immutable can be set once and again in the constructor.
- _custom errors_ are a new thing used in place of require.

# ethers.js stuff

- Coming. Didn't take notes for this part :(

# Hardhat stuff

## Hardhat

- A dev environment that basically helps you with all things smart contract.
- It provides both a local Ethereum network through its Hardhat network, as well as the ability to spin up a localhost network (by running yarn hardhat node).
- Extensible, composable, flexible tooling platform
- In short, it's a tool that automates a ton of shit for you

## Hardhat basics

- See docs [here](https://hardhat.org/hardhat-runner/docs/guides/project-setup)
- When spinning up a new project, do `yarn add --dev hardhat` and then run `yarn hardhat` to set up a template
- Compile your project with `yarn hardhat compile`
- Edit the hardhat.config.js file. This is where you can add networks (Optimism, Arbitrum, mainnet, Ganache, Goerli, Sepolia +++) you want to deploy to. By default, hardhat deploys to a local hardhat node that is destroyed between each use.
- Hardhat doesn't currently have a deployer, so it's better if you point it to your deploy script
- Deploy to your chosen network with `yarn hardhat run ./scripts/deploy.js --network [insertNetwork]`

## Scripts and tasks

- They basically do the same thing. Interact with contract, deploy smart contracts.
- Tasks are better for plugins. Scripts are better for your own local development.

## Mocking

- Mocking is used when you develop contracts locally or on testnets like hardhat, and your contracts is reliant on some other external (complex) contract. Your local/test contract may depend on a real object. Mocking is creating objects that simulate the behaviour of

# Miscellaneous stuff

## Debugging errors

1. Tinker and experiment with the error. No more than 20 min before proceeding to next step.
2. Check the documentation
3. Google the exact error
4. Ask questions on forums and community Q&A sites, e.g. stack overflow, ethereum stack exchange, /r/ethdev, or on discords.
5. Contribute by posting your solution! Join the community and strengthen the available resources.

## Exciting resources

Chainlink: https://docs.chain.link/docs/ethereum-addresses/
Ethereum global variables: https://ethereum-solidity.readthedocs.io/en/latest/units-and-global-variables.html
Libraries: https://solidity-by-example.org/library
