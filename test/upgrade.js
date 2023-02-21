const { ethers, upgrades } = require("hardhat");

const MANAGER = "0xe805e699abdd919d78608a3f40600ddb9610888c";
const FACTORY = "0x5293190788c636bffc8218b2c1653772422db02a";



async function main() {
    const BoxV2 = await ethers.getContractFactory("PoolManager");
    console.log("Upgrading Box...");
    await upgrades.upgradeProxy(MANAGER, BoxV2);
    console.log("Box upgraded");

    // const BoxV3 = await ethers.getContractFactory("PoolFactory");
    // console.log("Upgrading Box...");
    // await upgrades.upgradeProxy(FACTORY, BoxV3);
    // console.log("Box upgraded");

}

main();