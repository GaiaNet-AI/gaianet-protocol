const hre = require("hardhat");
async function main() {

  const RegistryFactory = await hre.ethers.getContractFactory("Registry");
  const registry = await RegistryFactory.deploy();

  console.log(`Deployed to ${registry.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
