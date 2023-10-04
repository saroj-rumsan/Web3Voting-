require("dotenv").config();
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
const config: HardhatUserConfig = {
  solidity: "0.8.19",

  networks: {
    mumbai: {
      url: process.env.RPC_URL,
      accounts: [process.env?.PRIVATE_KEY ?? ""],
    },
  },
};

export default config;
