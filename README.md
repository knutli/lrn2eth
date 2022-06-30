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
- data type
- name
- visibility (public, private, external, internal)

**Composability**
- A smart contract can be imported into another smart contract and given a name
- When interacting with a contract outside our own project we need its contract address and its ABI

**Global function things**
- msg.value
- msg.sender

**Chainlink out of the box stuff**
- Data feeds connect us to the real world
- Randomness function gives us provable random numbers, which we can't get on ETH because determinism
- Keepers are decentralized, event-driven computation. If trigger => do this. We can set both trigger and reaction 
- API calls with oracle nodes
