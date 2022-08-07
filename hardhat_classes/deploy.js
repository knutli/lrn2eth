const ethers = require("ethers"); //import ethersjs package
const fs = require("fs");

async function main() {
  // compile them in our code
  // compile separately
  // http://127.0.0.1:7545 = ganache rpc
  const provider = new ethers.providers.JsonRpcProvider(
    "http://127.0.0.1:7545"
  );
  const wallet = new ethers.Wallet(
    "ccbaaaece8a92dbcf9b6f52b8cc2633e93db3437f7297972f3ca803eca84daf1", //huge no-no to paste private key like this!
    provider
  );
  const abi = fs.readFileSync(
    "./simpleStorage_hh_sol_SimpleStorage.abi",
    "utf8"
  );
  const binary = fs.readFileSync(
    "./simpleStorage_hh_sol_SimpleStorage.bin",
    "utf8"
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
