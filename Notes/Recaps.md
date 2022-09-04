# Recaps

**Recap, Lesson 5: Ethers.js Simple Storage**

- Use node to run javascript
- Add dependencies in package.json
- Import packages
- async keyword to get access to asynchronous programming
- await keyword, which says "Hey wait for this promise to finish doing its thing"
- Connect to any blockchain using an RPC URL
- Connect our provider to a wallet/private key
- Encrypt our private keys
- Get our ABI and binary
- Deploy our contract programmatically
- Interact with our contract programmatically
- Formatting stuff
- Deploy a contract to a real testnet

**Recap, Lesson 6: Hardhat Simple Storage**

- Spin up my own hardhat project with `yarn hardhat`
- Compile with `yarn hardhat compile`
- Deploy with `yarn hardhat deploy --network [insert network]`
- All compilation goes into artifacts and cache. To clean we can delete these folders, or we can run `yarn hardhat clean`
- We can run scripts and tasks to deploy or interact with our smart contracts. Tasks are for plugins. Scripts are for local dev environment
- Import a whole lot of things, inc tasks, from hardhat
- We can programmatically verify our contracts using hardhat and hardhat plugins
- Tests (that we learned how to write ourselves) are super important if you're doing something more than just a side project.
- Learned about Coinmarketcap and Etherscan API and .env variables
- Learned about coverage, which checks how comprehensive our tests are
- Learned about gas reporter
- Learned a lot about hardhat config and how we can deploy to many different networks
