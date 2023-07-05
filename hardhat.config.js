require("@nomiclabs/hardhat-ethers");
require("@openzeppelin/hardhat-upgrades");
require("@nomiclabs/hardhat-etherscan");


/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  abiExporter: {
    path: "./abi",
    clear: false,
    flat: true,
    // only: [],
    // except: []
  },
  solidity: {
    compilers: [
      {
        version: "0.7.6",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.8.4",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        },
        contractSizer: {
          alphaSort: true,
          runOnCompile: true,
          disambiguatePaths: false,
        },
      },
      {
        version: "0.8.9",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.8.12",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.8.15",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      },
      {
        version: "0.6.12",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      }
    ]
  },
  defaultNetwork: "avax",
  networks: {
    hardhat: {
    },
    // testnet: {
    //   url: `https://data-seed-prebsc-2-s2.binance.org:8545`,
    //   accounts: []
    // },
    // ftmtest: {
    //   url: `https://rpc.testnet.fantom.network/`,
    //   accounts: []
    // },
    avax : {
      url : "https://api.avax-test.network/ext/bc/C/rpc",
      accounts : []
    }
  },
  etherscan: {
    // apiKey: {
    //   ropsten: "1RF6WGPIETERDRID3C5RB1PXQ1JU5JZQMP",
    //   rinkeby: "1RF6WGPIETERDRID3C5RB1PXQ1JU5JZQMP",
    //   bscTestnet : "37A4CA3UEI9Z61TDGX7EX5S4G65Y88H1CP",
        // avax : 9WEP4576DSSKKG6ERK8MK4RDV9B2CXCGJ2
    // }
    apiKey : "9WEP4576DSSKKG6ERK8MK4RDV9B2CXCGJ2"
  }
};
