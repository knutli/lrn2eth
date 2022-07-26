# lrn2eth
**My learning journey, from zero experience with coding, to becoming a Solidity whiz kid**

# Table of content: 
1. Data types
2. Storing data
3. Syntax structure
4. Libraries
5. Special functions and global functions
6. Composability and Chainlink stuff
7. Gas optimization


# Data types
- variables
- uint, uint8, uint256, int +++ 
- string
- address
- array[] (if you set an array, you can either define its size like array[3] or leave it like array[] for it to be infinitely long
- struct{} (define a new data type, and in it, I define what it contains)
- mapping(data type => data type)

Arrays, structs and mappings are special data types, and solidity needs to be told where they are supposed to be saved -> memory, storage or calldata. It already knows where uint will be saved, so you dont need to specify for those. A string is secretly/behind the scenes an array. 


# Storing data
- The EVM stores data in stack, memory, storage, calldata, code and logs
- memory is temporary MODIFIABLE variables, for example when you want to assign a value to a variable (e.g. within a function), and then delete the variable once the function has run 
- Calldata is temporary UNMODIFIABLE variables
- Storage is permanent MODIFIABLE variables (on the blockchain)


# Syntax structure
- Data type
- Name
- Visibility (public, private, external, internal)
- Payability (if yes, add payable flag)


# Libraries
- A library is like a contract, except it cannot send ether and it cannot declare state variables
- Instead of doing "contract contractName {}", you do "library libraryName {}" and import it like you would any other contract
- In the library you probably have functions, like function add()
- Once the library is imported into a contract, you can write "using libraryName for uint"
- by adding the keyword *using* we could give any uint within the contract the libraries functions and pass the uint as the first parameter of that function, e.g. x.add(123)


# Special functions
- A **constructor** is a function that is automatically called when the contract is published. A classic usecase is to set the owner of the contract to msg.sender. 
- A **modifier** is basically writing a piece of code and attach it to a keyword. This keyword is then placed along with other functions' stuff, like public view +++. See the fundMe example, and the onlyOwner modifier. 
- A **receive()** method is used as a fallback function in a contract and is called when ether is sent to a contract with no calldata. If the receive method does not exist, it will use the fallback function. The receive function cannot have arguments, cannot return anything and must have external visibility and payable state mutability. 
- A **fallback()** method is called if the receive function doesn't exist. fallback() external payable — when no other function matches (not even the receive function). Optionally payable.

**Global function things**
- msg.value (how many wei was sent with the message)
- msg.sender (address of the sender of the message)


# Composability
- A smart contract can be imported into another smart contract and given a name
- When interacting with a contract outside our own project we need its contract address and its ABI
- Import another contract with "import @PATH". Stick it at the top of your contract
- An "interface" is kinda like a recipe to get the content of the ABI. For example 
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
- Then do 
AggregatorV3Interface linkVar = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
and you can now use the contract's functions!
- return linkVar.version(); //version() is a function from the external contract! Cool!

**Chainlink out of the box stuff**
- Data feeds connect us to the real world
- Randomness function gives us provable random numbers, which we can't get on ETH because determinism
- Keepers are decentralized, event-driven computation. If trigger => do this. We can set both trigger and reaction 
- API calls with oracle nodes


# Gas optimization stuff
- *constant* and *immutable* are great to use if you're only setting your variables once. They are keywords that write variables directly into the bytecode of the contract instead of into its storage, making it easier to read, and therefore more gas efficient. Naming convention for constants is ALL_CAPS, while immutable is i_variable. 
- *custom errors* are a new thing used in place of require. 
 

# Exciting resources
Chainlink: https://docs.chain.link/docs/ethereum-addresses/
Ethereum global variables: https://ethereum-solidity.readthedocs.io/en/latest/units-and-global-variables.html
Libraries: https://solidity-by-example.org/library
