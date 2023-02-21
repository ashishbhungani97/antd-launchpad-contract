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
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
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
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
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
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
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
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
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
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WAVAX() external pure returns (address);

    

    function addLiquidityAVAX(
        address token,
        uint256 amountTokenDesired,
        uint256 amountTokenMin,
        uint256 amountAVAXMin,
        address to,
        uint256 deadline
    )
        external
        payable
        returns (
            uint256 amountToken,
            uint256 amountAVAX,
            uint256 liquidity
        );
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint256
    );

    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);

    function createPair(address tokenA, address tokenB)
        external
        returns (address pair);
}

interface IPoolManager {
  function increaseTotalValueLocked(uint256 value) external;
  function decreaseTotalValueLocked(uint256 value) external;
  function removePoolForToken(address token, address pool) external;
  function recordContribution(address user, address pool) external;
  
  event TvlChanged(uint256 totalLocked, uint256 totalRaised);
  event ContributionUpdated(uint256 totalParticipations);
  event PoolForTokenRemoved(address indexed token, address pool);
}

interface IPool {
    function initialize(
        address[7] memory _addrsArray, 
        uint256[11] memory _uint256Array, 
        string memory _poolDetails,
        uint256 _withdrawFees
    ) external;

    function setKycAudit(bool _kyc , bool _audit , string memory _kyclink,string memory _auditlink) external;
    function emergencyWithdraw(address payable to_, uint256 amount_) external;
    function setGovernance(address governance_) external;
    function emergencyWithdrawToken( address payaddress ,address tokenAddress, uint256 tokens ) external;
    function getPoolInfo() external view returns (address, uint8[] memory , uint256[] memory , string memory , string memory , string memory);

}

library PoolLibrary {
  using SafeMath for uint256;

  function convertCurrencyToToken(
    uint256 amount, 
    uint256 rate
  ) internal pure returns (uint256) {
    return amount.mul(rate).div(1e18);
  }

  function addLiquidity(
    address router,
    address token,
    uint256 liquidityBnb,
    uint256 liquidityToken,
    address pool
  ) internal returns (uint256 liquidity) {
    IERC20MetadataUpgradeable(token).approve(router, liquidityToken);
    (,, liquidity) = IUniswapV2Router01(router).addLiquidityAVAX{value: liquidityBnb}(
        token,
        liquidityToken,
        liquidityToken,
        liquidityBnb,
        pool,
        block.timestamp
    );
  }

  function calculateFeeAndLiquidity(
    uint256 totalRaised,
    uint256 ethFeePercent,
    uint256 tokenFeePercent,
    uint256 totalVolumePurchased,
    uint256 liquidityPercent,
    uint256 liquidityListingRate
  ) internal pure returns (uint256 bnbFee, uint256 tokenFee, uint256 liquidityBnb, uint256 liquidityToken) {
    bnbFee = totalRaised.mul(ethFeePercent).div(100);
    tokenFee = totalVolumePurchased.mul(tokenFeePercent).div(100);
    liquidityBnb = totalRaised.sub(bnbFee).mul(liquidityPercent).div(100);
    liquidityToken = liquidityBnb.mul(liquidityListingRate).div(1e18);
  }
}

interface ILock {
    function lock(
        address owner,
        address token,
        bool isLpToken,
        uint256 amount,
        uint256 unlockDate,
        string memory description
    ) external returns (uint256 lockId);
}

contract FairPool is OwnableUpgradeable, IPool , ReentrancyGuardUpgradeable {
   using SafeMath for uint256;
    using SafeERC20Upgradeable for IERC20MetadataUpgradeable;
    using AddressUpgradeable for address payable;
    using EnumerableSet for EnumerableSet.AddressSet;
    
    enum PoolState {
        inUse,
        completed,
        cancelled
    }

    enum PoolType {
        presale,
        privatesale,
        fairsale
    }

    struct poolInfo{
        address token; 
        uint256 startTime;
        uint256  endTime;
        uint256  totalRaised;
        uint256 softCap; 
        uint8 poolState; 
        uint8 poolType; 
        uint256 rate;
        uint256 liquidityPercent;
        uint256 liquidityUnlockTime;
    } 
    
    address public manager;
    address public router;
    address public lockContract;
    address public governance;
    address payable private adminWallet;
    uint256 public feesWithdraw; 
    address public token;
    uint256 public rate;
    uint256 public softCap;
    uint256 public maxContribution;
    bool public isMaxBuyLimit;
    bool public audit;
    bool public kyc;
    string public auditLink;
    string public kycLink;
    uint256 public startTime;
    uint256 public endTime;
    uint256 private tokenFeePercent;
    uint256 private ethFeePercent;
    uint256 public liquidityUnlockTime;
    uint256 public liquidityLockTime;
    uint256 public liquidityPercent;
    uint256 public refundType;
    string public poolDetails;
    uint256 public LockId;

    PoolState public poolState;
    PoolType public poolType;

    uint256 public totalRaised;
    uint256 public totalVolumePurchased;
    uint256 public totalClaimed;
    uint256 public totalRefunded;
    uint256 public totalToken;
    uint256 private tvl;
    
    mapping(address => uint256) public contributionOf;
    mapping(address => uint256) public purchasedOf;
    mapping(address => uint256) public claimedOf;
    mapping(address => uint256) public refundedOf;
   
    event Contributed(
        address indexed user,
        uint256 amount,
        uint256 timestamp
    );
    event WithdrawnContribution(address indexed user, uint256 amount);
    event Claimed(address indexed user, uint256 volume, uint256 total);
    event Finalized(uint256 liquidity, uint256 timestamp);
    event Cancelled(uint256 timestamp);
    event PoolUpdated(uint256 timestamp);
    event KycUpdated(bool completed, uint256 timestamp);
    event LiquidityWithdrawn(uint256 amount, uint256 timestamp);

    modifier inProgress() {
        require(poolState == PoolState.inUse, "Pool is either completed or cancelled");
        require(block.timestamp >= startTime && block.timestamp < endTime, "It's not time to buy");
        _;
    }

   modifier onlyOperator() {
        require(msg.sender == owner() || msg.sender == governance, "Only operator");
        _;
    }

    modifier onlyGovernance() {
        require(msg.sender == governance, "Only governance");
        _;
    }

    receive() external payable {
        if (msg.value > 0) contribute();
    }

    function initialize(
        address[7] memory _addrsArray, 
        uint256[11] memory _uint256Array, 
        string memory _poolDetails,
        uint256 _withdrawFees
    ) external override  initializer {
        require(manager == address(0), "Pool: Forbidden");
        require(_addrsArray[0] != address(0), "Invalid Token address");
        require(_uint256Array[1] > 0 , "Softcap must be >= 0");
        require(_uint256Array[2] > block.timestamp, "Start time should be in the future");
        require(_uint256Array[2] < _uint256Array[3], "End time must be after start time");
        require(_uint256Array[4] >= 300 , "Liquidity unlock time must be at least 5 minutes after pool is finalized");
        require(
            _uint256Array[5] >= 0 &&
            _uint256Array[5] <= 100 &&
            _uint256Array[6] >= 0 &&
            _uint256Array[6] <= 100,
            "Invalid fee settings. Must be percentage (0 -> 100)"
        );
        
        require(_uint256Array[7] >= 51 && _uint256Array[7] <= 100, "Invalid liquidity percentage");
        require(_uint256Array[8] == 0 || _uint256Array[8] == 1, "Refund type must be 0 (refund) or 1 (burn)");
        OwnableUpgradeable.__Ownable_init();
        transferOwnership(_addrsArray[4]);
        manager = _addrsArray[5];
        adminWallet = payable(_addrsArray[3]);
        token = _addrsArray[0];
        router = _addrsArray[1];
        governance = _addrsArray[2];
        softCap = _uint256Array[1];
        totalToken = _uint256Array[0];
        startTime = _uint256Array[2];
        endTime = _uint256Array[3];
        liquidityLockTime = _uint256Array[4];
        tokenFeePercent = _uint256Array[5];
        ethFeePercent = _uint256Array[6];
        liquidityPercent = _uint256Array[7];
        refundType = _uint256Array[8];
        poolDetails = _poolDetails;
        poolState = PoolState.inUse;
        poolType = PoolType.fairsale;
        feesWithdraw = _withdrawFees;
        lockContract = _addrsArray[6];
        maxContribution = _uint256Array[9];
        isMaxBuyLimit = _uint256Array[10] == 1 ? true : false;
    }

    function contribute() public payable inProgress{
        require(msg.value > 0, "Cant contribute 0");
        uint256 userTotalContribution = contributionOf[msg.sender].add(msg.value);
        
        if (contributionOf[msg.sender] == 0) {
            IPoolManager(manager).recordContribution(msg.sender, address(this));
        }
        if(isMaxBuyLimit){
            require(userTotalContribution <= maxContribution, "Contribute more than allowed");
        }
        contributionOf[msg.sender] = userTotalContribution;
        totalRaised = totalRaised.add(msg.value);
        rate = totalToken.mul(10**18).div(totalRaised);
        emit Contributed(msg.sender, msg.value, block.timestamp);
    }

    function claim() public nonReentrant {
        require(poolState == PoolState.completed, "Owner has not closed the pool yet");
        require(contributionOf[msg.sender] > 0, "you don't have enough contribution!!");
        
        uint256 volume = contributionOf[msg.sender];
        uint256 totalClaim = claimedOf[msg.sender];
        uint256 claimble  = PoolLibrary.convertCurrencyToToken(volume, rate);
        uint256 avalible = claimble.sub(totalClaim);
        require(avalible > 0 , "NO Reward Avalible For Claim");
        
        claimedOf[msg.sender] += avalible;
        totalClaimed = totalClaimed.add(avalible);
        IERC20MetadataUpgradeable(token).safeTransfer(msg.sender, avalible);
        emit Claimed(msg.sender, avalible, totalClaimed);
        
    }

    function withdrawContribution() external nonReentrant {
        if (poolState == PoolState.inUse) {
            require(block.timestamp >= endTime, "Pool is still in progress");
            require(totalRaised < softCap, "Soft cap reached");
        } else {
            require(poolState == PoolState.cancelled, "Cannot withdraw contribution because pool is completed");
        }
        require(contributionOf[msg.sender] > 0, "You Don't Have Enough contribution");
        uint256 fees = 0;
        if(poolState == PoolState.inUse){
            fees = feesWithdraw;
        }
        uint256 refundAmount = contributionOf[msg.sender];
        totalVolumePurchased = totalVolumePurchased.sub(purchasedOf[msg.sender]);

        refundedOf[msg.sender] = refundAmount;
        totalRefunded = totalRefunded.add(refundAmount);
        contributionOf[msg.sender] = 0;
        purchasedOf[msg.sender] = 0;
        totalRaised = totalRaised.sub(refundAmount);
        uint256 Countfees = refundAmount.mul(fees).div(10000);
        refundAmount = refundAmount.sub(Countfees);
        rate = totalToken.mul(10**18).div(totalRaised);

        payable(msg.sender).sendValue(refundAmount);
        payable(adminWallet).sendValue(Countfees);
        emit WithdrawnContribution(msg.sender, refundAmount);
    }

    function finalize() external onlyOperator nonReentrant{
        require(poolState == PoolState.inUse, "Pool was finialized or cancelled");
        require(totalRaised >= softCap && block.timestamp >= endTime,
            "It is not time to finish"
        );
        
        uint256 currentRate = totalToken.mul(10**18).div(totalRaised);
        
        poolState = PoolState.completed;
        totalVolumePurchased = totalToken;
        rate = currentRate;
        liquidityUnlockTime = block.timestamp + liquidityLockTime;
        (
            uint256 bnbFee,
            uint256 tokenFee,
            uint256 liquidityBnb,
            uint256 liquidityToken
        ) = PoolLibrary.calculateFeeAndLiquidity(
            totalRaised, 
            ethFeePercent, 
            tokenFeePercent, 
            totalToken, 
            liquidityPercent, 
            currentRate
        );
       
        uint256 remainingBnb = address(this).balance.sub(liquidityBnb).sub(bnbFee);
        uint256 remainingToken = 0;

        uint256 totalTokenSpent = liquidityToken.add(tokenFee).add(totalToken);
        remainingToken += IERC20MetadataUpgradeable(token).balanceOf(address(this)).sub(totalTokenSpent);
        

        // Pay platform fees
        if(bnbFee > 0){
            payable(adminWallet).sendValue(bnbFee);
        }
        if(tokenFee > 0){
            IERC20MetadataUpgradeable(token).safeTransfer(adminWallet, tokenFee);
        }

        // Refund remaining
        if (remainingBnb > 0) {
            payable(governance).sendValue(remainingBnb);
        }
       
       if (remainingToken > 0) {
            // 0: refund, 1: burn
            if (refundType == 0) {
                IERC20MetadataUpgradeable(token).safeTransfer(governance, remainingToken);
            } else {
                IERC20MetadataUpgradeable(token).safeTransfer(address(0xdead), remainingToken);
            }
       }

        tvl = liquidityBnb.mul(2);
        IPoolManager(manager).increaseTotalValueLocked(tvl);

        uint256 liquidity = PoolLibrary.addLiquidity(
            router,
            token,
            liquidityBnb,
            liquidityToken,
            address(this)
        );

        _createLiquidityLock();
        emit Finalized(liquidity, block.timestamp);
    }

    function _createLiquidityLock() internal{
        address swapFactory = IUniswapV2Router01(router).factory();
        address pair = IUniswapV2Factory(swapFactory).getPair(
            IUniswapV2Router01(router).WAVAX(),
            token
        );
        uint256 balance = IERC20MetadataUpgradeable(pair).balanceOf(address(this));
        IERC20MetadataUpgradeable(pair).approve(lockContract, balance);

        LockId = ILock(lockContract).lock(governance,token,true,balance,liquidityUnlockTime, '');
    }
    
    function getPoolInfo() external override view returns (address, uint8[] memory , uint256[] memory , string memory , string memory , string memory){
       
        uint8[] memory state = new uint8[](3);
        uint256[] memory info = new uint256[](12);
        
        state[0] = uint8(poolState);
        state[1] = uint8(poolType);
        state[2] = IERC20MetadataUpgradeable(token).decimals();
        info[0] = startTime;
        info[1] =  endTime;
        info[2] =  totalRaised;
        info[3] = 0; 
        info[4] = softCap; 
        info[5] = 0; 
        info[6] = 0;
        info[7] = rate;
        info[8] = 0;
        info[9] = liquidityPercent;
        info[10] = liquidityUnlockTime;
        info[11] = liquidityLockTime;
       return (token , state , info , IERC20MetadataUpgradeable(token).name() , IERC20MetadataUpgradeable(token).symbol() , poolDetails);
    }

    function cancel() external onlyOperator {
        require (poolState == PoolState.inUse, "Pool was either finished or cancelled");
        poolState = PoolState.cancelled;
        IPoolManager(manager).removePoolForToken(token, address(this));
        IERC20MetadataUpgradeable(token).safeTransfer(governance, IERC20MetadataUpgradeable(token).balanceOf(address(this)));
        emit Cancelled(block.timestamp);
    }

    function withdrawLeftovers() external onlyOperator {
        require(block.timestamp >= endTime, "It is not time to withdraw leftovers");
        require(totalRaised < softCap, "Soft cap reached, call finalize() instead");
        IERC20MetadataUpgradeable(token).safeTransfer(governance, IERC20MetadataUpgradeable(token).balanceOf(address(this)));
    }

    function emergencyWithdrawToken( address payaddress ,address tokenAddress, uint256 tokens ) external override onlyOwner 
    {
       IERC20MetadataUpgradeable(tokenAddress).transfer(payaddress, tokens);
    }

    function emergencyWithdraw(address payable to_, uint256 amount_) external override onlyOwner {
        to_.sendValue(amount_);
    }

    function updatePoolDetails(string memory details_) external onlyOperator {
        poolDetails = details_;
        emit PoolUpdated(block.timestamp);
    }

    function setGovernance(address governance_) external override onlyOwner {
        governance = governance_;
    }

    function convert(uint256 amountInWei) public view returns (uint256) {
        return PoolLibrary.convertCurrencyToToken(amountInWei, rate);
    }

    function userAvalibleClaim(address _userAddress) public view returns (uint256){

        uint256 volume = contributionOf[_userAddress];
        if(volume > 0 && poolState == PoolState.completed){
            uint256 totalClaim = claimedOf[_userAddress];
            uint256 claimble  = PoolLibrary.convertCurrencyToToken(volume, rate);
            uint256 avalible = claimble.sub(totalClaim);
            return avalible;
        }
        else{
            return 0;
        } 
    }

    function setKycAudit(bool _kyc , bool _audit , string memory _kyclink,string memory _auditlink) override external onlyOwner{
        kyc = _kyc;
        audit = _audit;
        kycLink=_kyclink;
        auditLink=_auditlink;
    }
}