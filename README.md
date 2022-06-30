# lrn2eth
My learning journey, from zero experience with coding, to becoming a Solidity champ

**Data types**
- variables
- uint, int, 
- string
- address
- array[] (if you set an array, you can either define its size like array[3] or leave it like array[] for it to be infinitely long
- struct{} (define a new data type, and in it, I define what it contains)
- mapping(data type => data type)

Arrays, structs and mappings are special data types, and solidity needs to be told where they are supposed to be saved. It already knows where uint will be saved, so you dont need to specify for those. A string is secretly/behind the scenes an array. 

**Storing data**
- The EVM stores data in stack, memory, storage, calldata, code and logs
- memory is temporary MODIFIABLE variables, for example when you want to assign a value to a variable (e.g. within a function), and then delete the variable once the function has run 
- Calldata is temporary UNMODIFIABLE variables
- Storage is permanent MODIFIABLE variables (on the blockchain)

**Syntax structure**
- Data type
- Name
- Visibility (public, private, external, internal)
- Payability (if yes, add payable flag)

For example: 
function fundMe() public payable {whatever the function is supposed to do}

**Composability**
- A smart contract can be imported into another smart contract and given a name
- When interacting with a contract outside our own project we need its contract address and its ABI
- Import another contract with "import @PATH". Stick it at the top of your contract
- An "interface" is kinda like a recipe to get the content of the ABI. For example 
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
- Then do 
AggregatorV3Interface linkVar = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
and you can now use the contract's functions!
- return linkVar.version(); //version() is a function from the external contract! Cool!

**Global function things**
- msg.value (
- msg.sender

**Chainlink out of the box stuff**
- Data feeds connect us to the real world
- Randomness function gives us provable random numbers, which we can't get on ETH because determinism
- Keepers are decentralized, event-driven computation. If trigger => do this. We can set both trigger and reaction 
- API calls with oracle nodes
