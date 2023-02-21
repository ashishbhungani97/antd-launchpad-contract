// SPDX-License-Identifier: MIT
pragma solidity =0.8.15;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol"; 

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b)
        internal
        pure
        returns (bool, uint256)
    {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryDiv}.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WAVAX() external pure returns (address);

    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);

    function allPairs(uint256) external view returns (address pair);

    function allPairsLength() external view returns (uint256);

    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

interface IPool{
    function setKycAudit(bool _kyc , bool _audit , string memory _kyclink,string memory _auditlink) external;
    function emergencyWithdraw(address payable to_, uint256 amount_) external;
    function setGovernance(address governance_) external;
    function emergencyWithdrawToken(
        address payaddress,
        address tokenAddress,
        uint256 tokens
    ) external;
}

interface IPresalePool {
    function initialize(
        address[7] memory _addressArr, 
        uint256 [16] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting,
        uint256 withdrawFees
    ) external;
}

interface IPrivatePool {
    function initialize(
       address[4] memory _addressArr, 
        uint256 [10] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting,
        uint256 _withdrawfees
    ) external;
}

interface IFairPool {
    function initialize(
        address[7] memory _addrsArray, 
        uint256[11] memory _uint256Array, 
        string memory _poolDetails,
        uint256 _withdrawFees
    ) external;
}

interface IPoolManager {
    function registerPool(
        address pool,
        address token,
        address owner
    ) external;

    function addPoolFactory(address factory) external;

    function payAmaPartner(
        address[] memory _partnerAddress,
        address _poolAddress
    ) external payable;

    function poolForToken(address token) external view returns (address);
    function isPoolGenerated(address pool) external view returns (bool);
    
}

library Clones {
    /**
     * @dev Deploys and returns the address of a clone that mimics the behaviour of `implementation`.
     *
     * This function uses the create opcode, which should never revert.
     */
    function clone(address implementation) internal returns (address instance) {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(
                ptr,
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
            )
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(
                add(ptr, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            instance := create(0, ptr, 0x37)
        }
        require(instance != address(0), "ERC1167: create failed");
    }

    /**
     * @dev Deploys and returns the address of a clone that mimics the behaviour of `implementation`.
     *
     * This function uses the create2 opcode and a `salt` to deterministically deploy
     * the clone. Using the same `implementation` and `salt` multiple time will revert, since
     * the clones cannot be deployed twice at the same address.
     */
    function cloneDeterministic(address implementation, bytes32 salt)
        internal
        returns (address instance)
    {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(
                ptr,
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
            )
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(
                add(ptr, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            instance := create2(0, ptr, 0x37, salt)
        }
        require(instance != address(0), "ERC1167: create2 failed");
    }

    /**
     * @dev Computes the address of a clone deployed using {Clones-cloneDeterministic}.
     */
    function predictDeterministicAddress(
        address implementation,
        bytes32 salt,
        address deployer
    ) internal pure returns (address predicted) {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(
                ptr,
                0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000
            )
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(
                add(ptr, 0x28),
                0x5af43d82803e903d91602b57fd5bf3ff00000000000000000000000000000000
            )
            mstore(add(ptr, 0x38), shl(0x60, deployer))
            mstore(add(ptr, 0x4c), salt)
            mstore(add(ptr, 0x6c), keccak256(ptr, 0x37))
            predicted := keccak256(add(ptr, 0x37), 0x55)
        }
    }

    /**
     * @dev Computes the address of a clone deployed using {Clones-cloneDeterministic}.
     */
    function predictDeterministicAddress(address implementation, bytes32 salt)
        internal
        view
        returns (address predicted)
    {
        return predictDeterministicAddress(implementation, salt, address(this));
    }
}

contract PoolFactory is OwnableUpgradeable,ReentrancyGuardUpgradeable{
    address public presaleAddress;
    address public PrivatesaleAddress;
    address public fairlaunchAddress;
    using SafeMath for uint256;
    using SafeERC20Upgradeable for IERC20Upgradeable;
    address public poolManager;
    address public lockContract;
    uint256 public presaleCreatePrice;
    uint256 public privateCreatePrice;
    uint256 public fairlaunchCreatePrice;
    bool public IsEnabled;
    uint256 public contributeWithdrawFee; //1% ~ 100
    using Clones for address;
    address payable public adminWallet;
    

    function initialize() external initializer {
        __Ownable_init();
        presaleAddress = 0x8Bf676ef206C25283722a40D0F978Cd8f21022aC;
        PrivatesaleAddress = 0xDE410C1E5d9a622122140a7D8E7d07Ec607D1dAf;
        fairlaunchAddress = 0xaDBEbb3356F3DE8Ac82E71bcA827528Ef1543978;
        poolManager = 0x7e96590D8924E3ee0530a438B59D1342eAEfcBa5;
        lockContract = 0x5EEb4792c5A39654bdD6bB91bE1D29f3acF32bf3;
        adminWallet = payable(0xAd5292D3D35F57CC0D7876cfD7B583DC99637b0d);
        presaleCreatePrice = 10000000000000000;
        privateCreatePrice = 20000000000000000;
        fairlaunchCreatePrice = 30000000000000000;
        contributeWithdrawFee = 1000;
        IsEnabled = true;
    }

    receive() external payable {}

    function setPresaleAddress(address _address) public onlyOwner {
        require(_address != address(0), "presaleAddress must be set");
        presaleAddress = _address;
    }

    function setFairLaunchAddress(address _address) public onlyOwner {
        require(_address != address(0), "presaleAddress must be set");
        fairlaunchAddress = _address;
    }

    function setPrivateAddress(address _address) public onlyOwner {
        require(_address != address(0), "presaleAddress must be set");
        PrivatesaleAddress = _address;
    }

    function setAdminWallet(address payable _address) public onlyOwner {
        require(_address != address(0), "presaleAddress must be set");
        adminWallet = _address;
    }

    function setcontributeWithdrawFee(uint256 _fees) public onlyOwner {
        contributeWithdrawFee = _fees;
    }

    modifier _checkTokeneEligible(address _tokenaddress , address _router) {
        address ethAddress = IUniswapV2Router01(_router).WAVAX();
        address factoryAddress = IUniswapV2Router01(_router).factory();
        address getPair = IUniswapV2Factory(factoryAddress).getPair(
            ethAddress,
            _tokenaddress
        );
        if(getPair != address(0)){
           uint256 Lpsupply = IERC20Upgradeable(getPair).totalSupply();
           require(Lpsupply == 0 , "Already Pair Exist in router, token not eligible for sale");
        }
        _;
    }

    modifier _checkPreRequirement(uint _id){
        require( IsEnabled, "Create sale currently on hold , try again after sometime!!" );
        require(poolManager != address(0) , "Currently on hold , try again after sometime!!");
        require(lockContract != address(0) , "Currently on hold , try again after sometime!!");
        if(_id == 1){
            require(presaleAddress != address(0) , "Sale Address is not set ! try again after sometime!!");
        }
        else if(_id == 2){
            require(PrivatesaleAddress != address(0) , "Sale Address is not set ! try again after sometime!!");
        }
        else if(_id == 3){
            require(fairlaunchAddress != address(0) , "Sale Address is not set ! try again after sometime!!");
        }
        else{
           revert();
        }
        _;
    }
    
    function _updatePoolInfo(address _poolAddress,address _tokenAddress, address _owner) internal {
        IPoolManager(poolManager).addPoolFactory(_poolAddress);
        IPoolManager(poolManager).registerPool(
            _poolAddress,
           _tokenAddress,
            _owner
        );
    }

    function _transferTokenExact(address _tokenAddress, address _poolAddress, uint256 _amount) internal{
        _safeTransferFromEnsureExactAmount(
           _tokenAddress,
            address(msg.sender),
            address(this),
            _amount
        );
        _safeTransferFromEnsureExactAmount(_tokenAddress, address(this) ,_poolAddress, _amount);
    }

    function initalizeClone(
        address _pair,
        address[7] memory _addressArr, 
        uint256 [16] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting
    ) internal _checkTokeneEligible(_addressArr[0],_addressArr[1]) {
        
        IPresalePool(_pair).initialize(
            _addressArr,
            _uint256Arr,
            _poolDetails,
            _whitelisting,
            contributeWithdrawFee
        );

        address poolForToken = IPoolManager(poolManager).poolForToken(
            _addressArr[0]
        );
        require(poolForToken == address(0), "Pool Already Exist!!");
    
    }

    function createPresaleSale(
        address[2] memory _addressArr, 
        uint256 [16] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting
    ) external payable _checkPreRequirement(1) {
        _checkfees(presaleCreatePrice);
        //fees transfer to Admin wallet
        (bool success, ) = adminWallet.call{ value: msg.value }("");
        require(success, "Address: unable to send value, recipient may have reverted");

        bytes32 salt = keccak256(
            abi.encodePacked(_poolDetails, block.timestamp)
        );
        address poolAddress = Clones.cloneDeterministic(presaleAddress, salt);
        //Clone Contract
        initalizeClone(
            poolAddress,
            [_addressArr[0],_addressArr[1],address(msg.sender),adminWallet,address(this),poolManager,lockContract], 
            _uint256Arr, 
            _poolDetails,
             _whitelisting
        );
         
        uint256 totalToken = _feesCount(
            _uint256Arr[0],
            _uint256Arr[1],
            _uint256Arr[5],
            _uint256Arr[11],
            _uint256Arr[9]
        );
        _transferTokenExact(_addressArr[0],poolAddress,totalToken);
        _updatePoolInfo(poolAddress,_addressArr[0],address(msg.sender));
    }

    function initalizePrivateClone(
        address _poolAddress,
        address[4] memory _addressArr, 
        uint256 [10] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting
    ) internal {
       
        IPrivatePool(_poolAddress).initialize(
           _addressArr, 
            _uint256Arr, 
           _poolDetails,
          _whitelisting,
          contributeWithdrawFee
        );
    }

    function createPrivateSale(
        uint256 [10] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting
    ) external payable _checkPreRequirement(2) {
        _checkfees(privateCreatePrice);

        (bool success, ) = adminWallet.call{ value: msg.value }("");
        require(success, "Address: unable to send value, recipient may have reverted");
        bytes32 salt = keccak256(
            abi.encodePacked(_poolDetails, block.timestamp)
        );
        address poolAddress = Clones.cloneDeterministic(PrivatesaleAddress, salt);
        initalizePrivateClone(
            poolAddress,
            [address(msg.sender),adminWallet,address(this),poolManager], 
            _uint256Arr,
            _poolDetails,
            _whitelisting
        );
        
        _updatePoolInfo(poolAddress,address(0),address(msg.sender));
    }

    function initalizeFairClone(
        address _pair,
        address[7] memory _addrsArray, 
        uint256[11] memory _uint256Array, 
        string memory _poolDetails
    ) internal _checkTokeneEligible(_addrsArray[0],_addrsArray[1]) {

        IFairPool(_pair).initialize(
           _addrsArray, 
            _uint256Array, 
            _poolDetails,
            contributeWithdrawFee
        );
    }

    function createFairSale(
        address[2] memory _addrsArray, 
        uint256[11] memory _uint256Array, 
        string memory _poolDetails
    ) external payable _checkPreRequirement(3) {
        _checkfees(fairlaunchCreatePrice);

        (bool success, ) = adminWallet.call{ value: msg.value }("");
        require(success, "Address: unable to send value, recipient may have reverted");

        bytes32 salt = keccak256( abi.encodePacked(_poolDetails, block.timestamp));
        address poolAddress = Clones.cloneDeterministic(fairlaunchAddress, salt);

        initalizeFairClone(
            poolAddress,
            [_addrsArray[0],_addrsArray[1],address(msg.sender),adminWallet,address(this),poolManager,lockContract], 
           _uint256Array, 
           _poolDetails 
        );
        

        uint256 totalToken = _feesFairCount(
            _uint256Array[0],
            _uint256Array[5],
            _uint256Array[7]
        );
        
        _transferTokenExact(_addrsArray[0],poolAddress,totalToken);
        _updatePoolInfo(poolAddress,_addrsArray[0],address(msg.sender));
    }

    function _safeTransferFromEnsureExactAmount(
        address token,
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        uint256 oldRecipientBalance = IERC20Upgradeable(token).balanceOf(
            recipient
        );
        if(sender == address(this)){
            IERC20Upgradeable(token).transfer(recipient, amount);
        }
        else{
            IERC20Upgradeable(token).safeTransferFrom(sender, recipient, amount);
        }
        
        uint256 newRecipientBalance = IERC20Upgradeable(token).balanceOf(
            recipient
        );
        require(
            newRecipientBalance - oldRecipientBalance == amount,
            "Not enough token was transfered If tax set Remove Our Address!!"
        );
    }

    function _checkfees(uint256 _fees) internal {
        require(
            msg.value >= _fees,
            "Payble Amount is less than required !!"
        );
    }
    
    function _feesCount(
        uint256 _rate,
        uint256 _Lrate,
        uint256 _hardcap,
        uint256 _liquidityPercent,
        uint256 _fees
    ) internal pure returns (uint256) {
        uint256 totalToken = (((_rate * _hardcap) / 10**18)).add(
            (((_hardcap * _Lrate) / 10**18) * _liquidityPercent) / 100
        );
        uint256 totalFees = (((((_rate * _hardcap) / 10**18)) * _fees) / 100);
        uint256 total = totalToken.add(totalFees);
        return total;
    }

    function _feesFairCount(
        uint256 _totaltoken,
        uint256 _tokenFees,
        uint256 _liquidityper
    ) internal pure returns (uint256) {
        uint256 totalToken = _totaltoken.add(
            (_totaltoken.mul(_liquidityper)).div(100)
        );
        uint256 totalFees = _totaltoken.mul(_tokenFees).div(100);
        uint256 total = totalToken + totalFees;
        return total;
    }

    function setPresalePoolPrice(uint256 _price) public onlyOwner {
        presaleCreatePrice = _price;
    }

    function setPrivatePoolPrice(uint256 _price) public onlyOwner {
        privateCreatePrice = _price;
    }

    function setFairPoolPrice(uint256 _price) public onlyOwner {
        fairlaunchCreatePrice = _price;
    }

    function setPoolManager(address _address) public onlyOwner {
        require(_address != address(0), "Invalid Address found");
        poolManager = _address;
    }

    function bnbLiquidity(address payable _reciever, uint256 _amount)
        public
        onlyOwner
    {
        _reciever.transfer(_amount);
    }

    function transferAnyERC20Token(
        address payaddress,
        address tokenAddress,
        uint256 tokens
    ) public onlyOwner {
        IERC20Upgradeable(tokenAddress).transfer(payaddress, tokens);
    }

    function updateKycAuditStatus(
        address _poolAddress,
        bool _kyc,
        bool _audit,
        string memory _kyclink,
        string memory _auditlink
    ) public onlyOwner {
        require(
            IPoolManager(poolManager).isPoolGenerated(_poolAddress),
            "Pool Not exist !!"
        );
        IPool(_poolAddress).setKycAudit(_kyc, _audit , _kyclink , _auditlink );
    }

    function poolEmergencyWithdrawToken(
        address poolAddress,
        address payaddress,
        address tokenAddress,
        uint256 tokens
    ) public onlyOwner {
        IPool(poolAddress).emergencyWithdrawToken(
            payaddress,
            tokenAddress,
            tokens
        );
    }

    function poolEmergencyWithdraw(
        address poolAddress,
        address payable to_,
        uint256 amount_
    ) public onlyOwner {
        IPool(poolAddress).emergencyWithdraw(to_, amount_);
    }

    function poolSetGovernance(address poolAddress, address _governance)
        public
        onlyOwner
    {
        IPool(poolAddress).setGovernance(_governance);
    }

    function setLockContractAddress(address _lockAddress) public onlyOwner{
        require(_lockAddress != address(0) , "Lock Contract Addrses zero found!!!");
        lockContract = _lockAddress;
    }
}
