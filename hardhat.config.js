require("@nomicfoundation/hardhat-toolbox");

const RPCUrl = "https://mainnet.cybermiles.io"
const priKey = "Your-private-key"

module.exports = {
  solidity: "0.8.20",
  networks: {
    cybermiles: {
      url: RPCUrl,
      accounts:[priKey]
    }
  },
};
