// SPDX-License-Identifier: MIT
pragma solidity =0.8.15;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

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

interface IPoolFactory {
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
        address[4] memory _addressArr, 
        uint256 [10] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting,
        uint256 withdrawfees
    ) external;

    function setKycAudit(bool _kyc , bool _audit , string memory _kyclink,string memory _auditlink) external;
    function emergencyWithdraw(address payable to_, uint256 amount_) external;
    function setGovernance(address governance_) external;
    function getPoolInfo() external view returns (address, uint8[] memory , uint256[] memory , string memory , string memory , string memory);
}

library PoolLibrary {
  using SafeMath for uint256;

  function getContributionAmount(
    uint256 contributed,
    uint256 minContribution,
    uint256 maxContribution,
    uint256 availableToBuy
  ) internal pure returns (uint256, uint256) {
        // Bought all their allocation
        if (contributed >= maxContribution) {
            return (0, 0);
        }
        uint256 remainingAllocation = maxContribution.sub(contributed);

        // How much bnb is one token
        if (availableToBuy > remainingAllocation) {
            if (contributed > 0) {
                return (0, remainingAllocation);
            } else {
                return (minContribution, remainingAllocation);
            }
        } else {
             if (contributed > 0) {
                return (0, availableToBuy);
            } else {
                if (availableToBuy < minContribution) {
                    return (0, availableToBuy);
                } else {
                    return (minContribution, availableToBuy);
                }
            }
        }
  }

  function convertCurrencyToToken(
    uint256 amount, 
    uint256 rate
  ) internal pure returns (uint256) {
    return amount.mul(rate).div(1e18);
  }

  function calculateFeeAndLiquidity(
    uint256 totalRaised,
    uint256 ethFeePercent
  ) internal pure returns (uint256 bnbFee) {
    bnbFee = totalRaised.mul(ethFeePercent).div(100);
  }
}

library FullMath {
  /// @notice Calculates floor(a×b÷denominator) with full precision. Throws if result overflows a uint256 or denominator == 0
  /// @param a The multiplicand
  /// @param b The multiplier
  /// @param denominator The divisor
  /// @return result The 256-bit result
  /// @dev Credit to Remco Bloemen under MIT license https://xn--2-umb.com/21/muldiv
  function mulDiv(
    uint256 a,
    uint256 b,
    uint256 denominator
  ) internal pure returns (uint256 result) {
    // 512-bit multiply [prod1 prod0] = a * b
    // Compute the product mod 2**256 and mod 2**256 - 1
    // then use the Chinese Remainder Theorem to reconstruct
    // the 512 bit result. The result is stored in two 256
    // variables such that product = prod1 * 2**256 + prod0
    uint256 prod0; // Least significant 256 bits of the product
    uint256 prod1; // Most significant 256 bits of the product
    assembly {
      let mm := mulmod(a, b, not(0))
      prod0 := mul(a, b)
      prod1 := sub(sub(mm, prod0), lt(mm, prod0))
    }

    // Handle non-overflow cases, 256 by 256 division
    if (prod1 == 0) {
      require(denominator > 0);
      assembly {
        result := div(prod0, denominator)
      }
      return result;
    }

    // Make sure the result is less than 2**256.
    // Also prevents denominator == 0
    require(denominator > prod1);

    ///////////////////////////////////////////////
    // 512 by 256 division.
    ///////////////////////////////////////////////

    // Make division exact by subtracting the remainder from [prod1 prod0]
    // Compute remainder using mulmod
    uint256 remainder;
    assembly {
      remainder := mulmod(a, b, denominator)
    }
    // Subtract 256 bit number from 512 bit number
    assembly {
      prod1 := sub(prod1, gt(remainder, prod0))
      prod0 := sub(prod0, remainder)
    }

    // Factor powers of two out of denominator
    // Compute largest power of two divisor of denominator.
    // Always >= 1.
    unchecked {
      uint256 twos = (type(uint256).max - denominator + 1) & denominator;
      // Divide denominator by power of two
      assembly {
        denominator := div(denominator, twos)
      }

      // Divide [prod1 prod0] by the factors of two
      assembly {
        prod0 := div(prod0, twos)
      }
      // Shift in bits from prod1 into prod0. For this we need
      // to flip `twos` such that it is 2**256 / twos.
      // If twos is zero, then it becomes one
      assembly {
        twos := add(div(sub(0, twos), twos), 1)
      }
      prod0 |= prod1 * twos;

      // Invert denominator mod 2**256
      // Now that denominator is an odd number, it has an inverse
      // modulo 2**256 such that denominator * inv = 1 mod 2**256.
      // Compute the inverse by starting with a seed that is correct
      // correct for four bits. That is, denominator * inv = 1 mod 2**4
      uint256 inv = (3 * denominator) ^ 2;
      // Now use Newton-Raphson iteration to improve the precision.
      // Thanks to Hensel's lifting lemma, this also works in modular
      // arithmetic, doubling the correct bits in each step.
      inv *= 2 - denominator * inv; // inverse mod 2**8
      inv *= 2 - denominator * inv; // inverse mod 2**16
      inv *= 2 - denominator * inv; // inverse mod 2**32
      inv *= 2 - denominator * inv; // inverse mod 2**64
      inv *= 2 - denominator * inv; // inverse mod 2**128
      inv *= 2 - denominator * inv; // inverse mod 2**256

      // Because the division is now exact we can divide by multiplying
      // with the modular inverse of denominator. This will give us the
      // correct result modulo 2**256. Since the precoditions guarantee
      // that the outcome is less than 2**256, this is the final result.
      // We don't need to compute the high bits of the result and prod1
      // is no longer required.
      result = prod0 * inv;
      return result;
    }
  }
}

contract PrivatePool is OwnableUpgradeable, IPool, ReentrancyGuardUpgradeable {
    using SafeMath for uint256;
    using AddressUpgradeable for address;
    using EnumerableSet for EnumerableSet.AddressSet;
    uint256 public feesWithdraw; 

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

    address public manager;
    address public governance;
    address payable private adminWallet;
    uint256 public minContribution;
    uint256 public maxContribution;
    uint256 public softCap;
    uint256 public hardCap;

    bool public audit;
    bool public kyc;
    string public auditLink;
    string public kycLink;
    uint256 public startTime;
    uint256 public endTime;
    uint256 private ethFeePercent;
    string public poolDetails;

    PoolState public poolState;
    PoolType public poolType;

    uint256 public totalRaised;
    uint256 public totalClaimed;
    uint256 public totalRefunded;
    uint256 public remainingBnb;

    mapping(address => uint256) public contributionOf;
    mapping(address => uint256) public refundedOf;

    uint256 public tgeDate; // TGE date for vesting locks, unlock date for normal locks
    uint256 public tgeBps; // In bips. Is 0 for normal locks
    uint256 public cycle; // Is 0 for normal locks
    uint256 public cycleBps; // In bips. Is 0 for normal locks

    bool public useWhitelisting;
    EnumerableSet.AddressSet private whitelistedUsers;
    mapping(address => bool) private isWhitelisted;
    
    event Contributed(
        address indexed user,
        uint256 amount,
        uint256 timestamp
    );

    event WithdrawnContribution(address indexed user, uint256 amount);
    event Claimed(address indexed user, uint256 total);
    event Finalized(uint256 liquidity, uint256 timestamp);
    event Cancelled(uint256 timestamp);
    event PoolUpdated(uint256 timestamp);
    event KycUpdated(bool completed, uint256 timestamp);
    event LiquidityWithdrawn(uint256 amount, uint256 timestamp);

    
    modifier inProgress() {
        require(poolState == PoolState.inUse, "Pool is either completed or cancelled");
        require(block.timestamp >= startTime && block.timestamp < endTime, "It's not time to buy");
        require(totalRaised < hardCap, "Hardcap reached");
        _;
    }

    modifier onlyWhitelisted() {
        if (useWhitelisting) {
            require(isWhitelisted[msg.sender], "User is not whitelisted");
        }
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
        address[4] memory _addressArr, 
        uint256 [10] memory _uint256Arr, 
        string memory _poolDetails,
        bool _whitelisting,
        uint256 _withdrawfees
    ) external override initializer {
        require(manager == address(0), "Pool: Forbidden");
        require(_uint256Arr[0] <= _uint256Arr[1], "Min contribution amount must be less than or equal to max");
        require(_uint256Arr[2].mul(2) >= _uint256Arr[3] && _uint256Arr[2] <= _uint256Arr[3] && _uint256Arr[3] > 0, "Softcap must be >= 50% of hardcap");
        require(_uint256Arr[4] > block.timestamp, "Start time should be in the future");
        require(_uint256Arr[4] < _uint256Arr[5], "End time must be after start time");
        require(
            _uint256Arr[6] > 0 &&
            _uint256Arr[6] <= 100 ,
            "Invalid fee settings. Must be percentage (1 -> 100)"
        );
        require(_uint256Arr[8] >= 0, "Invalid cycle");
        require(_uint256Arr[7] >= 0 && _uint256Arr[7] < 10_000, "Invalid bips for TGE");
        require(_uint256Arr[9] >= 0 && _uint256Arr[9] < 10_000, "Invalid bips for cycle");
        require(
            _uint256Arr[7] + _uint256Arr[9] <= 10_000,
            "Sum of TGE bps and cycle should be less than 10000"
        );
        OwnableUpgradeable.__Ownable_init();
        transferOwnership(_addressArr[2]);
        manager = _addressArr[3];
        adminWallet = payable(_addressArr[1]);
        governance = payable(_addressArr[0]);
        minContribution = _uint256Arr[0];
        maxContribution = _uint256Arr[1];
        softCap = _uint256Arr[2];
        hardCap = _uint256Arr[3];
        startTime = _uint256Arr[4];
        endTime = _uint256Arr[5];
        ethFeePercent = _uint256Arr[6];
        tgeBps = _uint256Arr[7]; 
        cycle = _uint256Arr[8];
        cycleBps = _uint256Arr[9];
        feesWithdraw = _withdrawfees;
        useWhitelisting = _whitelisting;
        poolDetails = _poolDetails;
        poolState = PoolState.inUse;
        poolType = PoolType.privatesale;
    }

    function addWhitelistedUsers(address[] memory users) external {
        for (uint256 i = 0; i < users.length; i++) {
            setWhitelist(users[i], true);
        }
    }

    function addWhitelistedUser(address user) external {
        setWhitelist(user, true);
    }

    function removeWhitelistedUsers(address[] memory users) external {
        for (uint256 i = 0; i < users.length; i++) {
            setWhitelist(users[i], false);
        }
    }

    function removeWhitelistedUser(address user) external {
        setWhitelist(user, false);
    }

    function isUserWhitelisted(address user) public view returns (bool) {
        if (useWhitelisting) {
            return isWhitelisted[user];
        }
        return true;
    }

    function setWhitelist(address user, bool whitelisted) internal onlyOperator {
        require(useWhitelisting, "Pool does not use whitelisting option");
        if (whitelisted) {
            if (!whitelistedUsers.contains(user)) {
                whitelistedUsers.add(user);
                isWhitelisted[user] = true;
            }
        } else {
            if (whitelistedUsers.contains(user)) {
                whitelistedUsers.remove(user);
                isWhitelisted[user] = false;
            }
        }
    }

     function getPoolInfo() external override view returns (address, uint8[] memory , uint256[] memory , string memory , string memory , string memory){
       
        uint8[] memory state = new uint8[](3);
        uint256[] memory info = new uint256[](11);
        
        state[0] = uint8(poolState);
        state[1] = uint8(poolType);
        state[2] = 0;
        info[0] = startTime;
        info[1] =  endTime;
        info[2] =  totalRaised;
        info[3] = hardCap; 
        info[4] = softCap; 
        info[5] = minContribution; 
        info[6] = maxContribution;
        info[7] = 0;
        info[8] = 0;
        info[9] = 0;
        info[10] = 0;
       
       return (address(0) , state , info , '' , '' , poolDetails);
    }

    function getNumberOfWhitelistedUsers() public view returns (uint256) {
        return whitelistedUsers.length();
    }

    function getWhitelistedUsers(uint256 startIndex, uint256 endIndex) public view returns (address[] memory) {
        if (endIndex >= whitelistedUsers.length()) {
            endIndex = whitelistedUsers.length() - 1;
        }
        uint256 len = endIndex - startIndex + 1;
        address[] memory whitelistedParticipantsPart = new address[](len);

        uint256 counter = 0;
        for (uint256 i = startIndex; i <= endIndex; i++) {
            whitelistedParticipantsPart[counter] = whitelistedUsers.at(i);
            counter++;
        }
        return whitelistedParticipantsPart;
    }

    
    function contribute() public payable inProgress onlyWhitelisted{
        require(msg.value > 0, "Cant contribute 0");
       
        uint256 userTotalContribution = contributionOf[msg.sender].add(msg.value);
        // Allow to contribute with an amount less than min contribution
        // if the remaining contribution amount is less than min
        if (hardCap.sub(totalRaised) >= minContribution) {
            require(userTotalContribution >= minContribution, "Min contribution not reached");
        }
        require(userTotalContribution <= maxContribution, "Contribute more than allowed");
        require(totalRaised.add(msg.value) <= hardCap, "Buying amount exceeds hard cap");
        
        
        if (contributionOf[msg.sender] == 0) {
            IPoolFactory(manager).recordContribution(msg.sender, address(this));
        }
        contributionOf[msg.sender] = userTotalContribution;
        totalRaised = totalRaised.add(msg.value);
        emit Contributed(msg.sender, msg.value, block.timestamp);
    }

    function claimFund() public nonReentrant onlyOperator{
        require(poolState == PoolState.completed, "Owner has not closed the pool yet");
        require(tgeDate <= block.timestamp , "pool still not finalized!!!");
        uint256 withdrawable = 0;

        if (tgeBps > 0) {
            withdrawable = _withdrawableFund();
        }
        else{
            if(remainingBnb >= totalClaimed){
                withdrawable = remainingBnb.sub(totalClaimed);
            }
            else{
                withdrawable = 0;
            }
        }

        require(withdrawable > 0 , "No token avalible for claim!!");
        totalClaimed = totalClaimed.add(withdrawable);
        (bool success, ) = payable(governance).call{value: withdrawable}("");
        require(success , "Transfer Amount Failed!!");
        emit Claimed(msg.sender, withdrawable);
    }

    function _withdrawableFund()
        internal
        view
        returns (uint256)
    {
        if (remainingBnb == 0) return 0;
        if (totalClaimed >= remainingBnb) return 0;
        if (block.timestamp < tgeDate) return 0;
        if (cycle == 0) return 0;

        uint256 tgeReleaseAmount = FullMath.mulDiv(
            remainingBnb,
            tgeBps,
            10_000
        );
        uint256 cycleReleaseAmount = FullMath.mulDiv(
            remainingBnb,
            cycleBps,
            10_000
        );
        uint256 currentTotal = 0;
        if (block.timestamp >= tgeDate) {
            currentTotal =
                (((block.timestamp - tgeDate) / cycle) *
                    cycleReleaseAmount) +
                tgeReleaseAmount; // Truncation is expected here
        }
        uint256 withdrawable = 0;
        if (currentTotal > remainingBnb) {
            withdrawable = remainingBnb - totalClaimed;
        } else {
            withdrawable = currentTotal - totalClaimed;
        }
        return withdrawable;
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
        
        refundedOf[msg.sender] = refundAmount;
        totalRefunded = totalRefunded.add(refundAmount);
        contributionOf[msg.sender] = 0;
        totalRaised = totalRaised.sub(refundAmount);
        uint256 Countfees = refundAmount.mul(fees).div(10000);
        refundAmount = refundAmount.sub(Countfees);
        
        // payable(msg.sender).sendValue(refundAmount);
        // payable(adminWallet).sendValue(Countfees);
        (bool successA, ) = payable(msg.sender).call{value: refundAmount}("");
        (bool successB, ) = payable(adminWallet).call{value: Countfees}("");
        require(successA && successB , "Transfer Amount Failed!!");
        emit WithdrawnContribution(msg.sender, refundAmount);
    }

    function finalize() external onlyOperator nonReentrant {
        require(poolState == PoolState.inUse, "Pool was finialized or cancelled");
        require(
            totalRaised == hardCap || hardCap.sub(totalRaised) < minContribution ||
                (totalRaised >= softCap && block.timestamp >= endTime),
            "It is not time to finish"
        );

        poolState = PoolState.completed;
        tgeDate = block.timestamp; 

        (
            uint256 bnbFee
        ) = PoolLibrary.calculateFeeAndLiquidity(
            totalRaised, 
            ethFeePercent
        );
       
        remainingBnb = address(this).balance.sub(bnbFee);
        
        // Pay platform fees
        if(bnbFee > 0){
            (bool success, ) = payable(adminWallet).call{value: bnbFee}("");
            require(success , "Transfer Amount Failed!!");
        }
        
        emit Finalized(totalRaised, block.timestamp);
    }

    function cancel() external onlyOperator {
        require (poolState == PoolState.inUse, "Pool was either finished or cancelled");
        poolState = PoolState.cancelled;
        emit Cancelled(block.timestamp);
    }

    function emergencyWithdraw(address payable to_, uint256 amount_) external override onlyOwner {
        (bool success, ) = payable(to_).call{value: amount_}("");
        require(success , "Transfer Amount Failed!!");
    }

    function updatePoolDetails(string memory details_) external onlyOperator {
        poolDetails = details_;
        emit PoolUpdated(block.timestamp);
    }

    function setGovernance(address governance_) external override onlyOwner {
        governance = governance_;
    }

    function remainingContribution() public view returns (uint256) {
        return hardCap.sub(totalRaised);
    }

    function setKycAudit(bool _kyc , bool _audit , string memory _kyclink,string memory _auditlink) override external onlyOwner{
        kyc = _kyc;
        audit = _audit;
        kycLink=_kyclink;
        auditLink=_auditlink;
    }

    function setWhitelisting(bool _whitelisting) public onlyOperator{
        useWhitelisting = _whitelisting;
    }

    function availableClaimFund() public view returns(uint256){
        uint256 withdrawable = 0;

        if (tgeBps > 0) {
            withdrawable = _withdrawableFund();
        }
        else{
            if(remainingBnb >= totalClaimed){
                withdrawable = remainingBnb.sub(totalClaimed);
            }
            else{
                withdrawable = 0;
            }
        }

        return withdrawable;
    }

}