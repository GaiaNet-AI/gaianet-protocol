# gaianet-protocol

## Prerequisites

- Node.js
- NPM

## Deploy the contract

The first step, clone the project and install the dependency.
```
git clone https://github.com/grorge123/gaianet-protocol.git
cd gaianet-protocol
npm install
```
You can edit the `hardhat.config.js` to choose which network and account to deploy the contract.
In the example, we use CyberMiles chain to demo.

Next step, run the following command to run the deploy script.
```
npx hardhat run scripts/deploy.js --network cybermiles
```

Then you can see the contract address.
```
Deployed to 0x30BB7f0ff7Cd36765e85d4f2100376ecBA194aa1
```
