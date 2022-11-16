const { expect } = require("chai");
// const { ethers, upgrades } = require('hardhat');

async function test() {
    // PresaleMaster = await (await ethers.getContractFactory("PresalePool")).deploy();
    // console.log("PresalePool deployed to:", PresaleMaster.address);
    // expect(PresaleMaster.address).to.exist;

    // privatepairMaster = await (await ethers.getContractFactory("PrivatePool")).deploy();
    // console.log("Private Pool deployed to:", privatepairMaster.address);
    // expect(privatepairMaster.address).to.exist;

    // fairpairMaster = await (await ethers.getContractFactory("FairPool")).deploy();
    // console.log("FairPool Pool deployed to:", fairpairMaster.address);
    // expect(fairpairMaster.address).to.exist;

    // const PairManager1 = await (await ethers.getContractFactory("PoolManager"));
    // console.log("PoolManager1 deploying....");

    // const PairManager2 = await upgrades.deployProxy(PairManager1,{ initializer: 'initialize' });
    // await PairManager2.deployed();
    // console.log('PairManager2 deployed to:', PairManager2.address);

    
    // const pairFactory1 = await ethers.getContractFactory('PoolFactory');
    // console.log('Deploying pairFactory1...');

    // const pairFactory2 = await upgrades.deployProxy(pairFactory1,{ initializer: 'initialize' });
    // await pairFactory2.deployed();
    // console.log('pairFactory2 deployed to:', pairFactory2.address);

    // PinkLocker = await (await ethers.getContractFactory("PinkLocker")).deploy();
    // console.log("PinkLocker deployed to:", PinkLocker.address);
    // expect(PinkLocker.address).to.exist;

    USDC = await (await ethers.getContractFactory("USDC")).deploy();
    console.log("USDC deployed to:", USDC.address);
    expect(USDC.address).to.exist;

}

test();