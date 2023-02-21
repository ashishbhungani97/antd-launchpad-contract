// SPDX-License-Identifier: MIT
pragma solidity =0.8.4;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
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

interface IPoolManager {
    function increaseTotalValueLocked(uint256 value) external;

    function decreaseTotalValueLocked(uint256 value) external;

    function removePoolForToken(address token, address pool) external;

    function recordContribution(address user, address pool) external;

    function isPoolGenerated(address pool) external view returns (bool);

    function registerPool(
        address pool,
        address token,
        address owner
    ) external;

    function poolForToken(address token) external view returns (address);

    event TvlChanged(uint256 totalLocked, uint256 totalRaised);
    event ContributionUpdated(uint256 totalParticipations);
    event PoolForTokenRemoved(address indexed token, address pool);
}

interface IPool {
    function getPoolInfo()
        external
        view
        returns (
            address,
            uint8[] memory,
            uint256[] memory,
            string memory,
            string memory,
            string memory
        );
}

contract PoolManager is OwnableUpgradeable, IPoolManager {
    using EnumerableSet for EnumerableSet.AddressSet;
    using SafeMath for uint256;
    using SafeERC20Upgradeable for IERC20Upgradeable;

    struct CumulativeLockInfo {
        address poolAddress;
        address token;
        uint8 poolState;
        uint8 poolType;
        uint8 decimals;
        uint256 startTime;
        uint256 endTime;
        uint256 totalRaised;
        uint256 hardCap;
        uint256 softCap;
        uint256 minContribution;
        uint256 maxContribution;
        uint256 rate;
        uint256 liquidityListingRate;
        uint256 liquidityPercent;
        uint256 liquidityUnlockTime;
        uint256 liquidityLockTime;
        string name;
        string symbol;
        string poolDetails;
    }

    EnumerableSet.AddressSet private poolFactories;
    EnumerableSet.AddressSet private _pools;
    mapping(address => EnumerableSet.AddressSet) private _poolsOf;
    mapping(address => EnumerableSet.AddressSet) private _contributedPoolsOf;
    mapping(address => address) private _poolForToken;

    uint256 public totalValueLockedInBnb;
    uint256 public totalLiquidityRaisedInBnb;
    uint256 public totalParticipants;

    event sender(address sender);
    
    receive() external payable {}

    function initialize() external initializer {
        __Ownable_init();
    }

    modifier onlyAllowedFactory() {
        emit sender(msg.sender);
        require(
            poolFactories.contains(msg.sender),
            "Not a whitelisted factory"
        );
        _;
    }

    function addPoolFactory(address factory) public onlyAllowedFactory {
        poolFactories.add(factory);
    }

    function addAdminPoolFactory(address factory) public onlyOwner {
        poolFactories.add(factory);
    }

    function addPoolFactories(address[] memory factories) external onlyOwner {
        for (uint256 i = 0; i < factories.length; i++) {
            addPoolFactory(factories[i]);
        }
    }

    function removePoolFactory(address factory) external onlyOwner {
        poolFactories.remove(factory);
    }

    function isPoolGenerated(address pool) public view override returns (bool) {
        return _pools.contains(pool);
    }

    function poolForToken(address token)
        external
        view
        override
        returns (address)
    {
        return _poolForToken[token];
    }

    function registerPool(
        address pool,
        address token,
        address owner
    ) external override onlyAllowedFactory {
        _pools.add(pool);
        _poolsOf[owner].add(pool);
        _poolForToken[token] = pool;
    }

    function increaseTotalValueLocked(uint256 value)
        external
        override
        onlyAllowedFactory
    {
        totalValueLockedInBnb = totalValueLockedInBnb.add(value);
        totalLiquidityRaisedInBnb = totalLiquidityRaisedInBnb.add(value);
        emit TvlChanged(totalValueLockedInBnb, totalLiquidityRaisedInBnb);
    }

    function decreaseTotalValueLocked(uint256 value)
        external
        override
        onlyAllowedFactory
    {
        if (totalValueLockedInBnb < value) {
            totalValueLockedInBnb = 0;
        } else {
            totalValueLockedInBnb = totalValueLockedInBnb.sub(value);
        }
        emit TvlChanged(totalValueLockedInBnb, totalLiquidityRaisedInBnb);
    }

    function recordContribution(address user, address pool)
        external
        override
        onlyAllowedFactory
    {
        totalParticipants = totalParticipants.add(1);
        _contributedPoolsOf[user].add(pool);
        emit ContributionUpdated(totalParticipants);
    }

    function removePoolForToken(address token, address pool)
        external
        override
        onlyAllowedFactory
    {
        _poolForToken[token] = address(0);
        emit PoolForTokenRemoved(token, pool);
    }

    function getPoolsOf(address owner) public view returns (address[] memory) {
        uint256 length = _poolsOf[owner].length();
        address[] memory allPools = new address[](length);
        for (uint256 i = 0; i < length; i++) {
            allPools[i] = _poolsOf[owner].at(i);
        }
        return allPools;
    }

    function getAllPools() public view returns (address[] memory) {
        uint256 length = _pools.length();
        address[] memory allPools = new address[](length);
        for (uint256 i = 0; i < length; i++) {
            allPools[i] = _pools.at(i);
        }
        return allPools;
    }

    function getPoolAt(uint256 index) public view returns (address) {
        return _pools.at(index);
    }

    function getTotalNumberOfPools() public view returns (uint256) {
        return _pools.length();
    }

    function getTotalNumberOfContributedPools(address user)
        public
        view
        returns (uint256)
    {
        return _contributedPoolsOf[user].length();
    }

    function getAllContributedPools(address user)
        public
        view
        returns (address[] memory)
    {
        uint256 length = _contributedPoolsOf[user].length();
        address[] memory allPools = new address[](length);
        for (uint256 i = 0; i < length; i++) {
            allPools[i] = _contributedPoolsOf[user].at(i);
        }
        return allPools;
    }

    function getContributedPoolAtIndex(address user, uint256 index)
        public
        view
        returns (address)
    {
        return _contributedPoolsOf[user].at(index);
    }

    function getTopPool() public view returns (CumulativeLockInfo[] memory) {
        uint256 length = _pools.length();
        if(length > 0){
            uint256 rlength = 0;
            for (uint256 i = 0; i < length; i++) {
                (
                    ,
                    uint8[] memory saleType,
                    uint256[] memory info,
                ,
                    ,
                    
                ) = IPool(_pools.at(i)).getPoolInfo();
                if(saleType[0] == 0 && info[1] >= block.timestamp){
                    rlength += 1;
                }
            }
            CumulativeLockInfo[] memory poolInfo = new CumulativeLockInfo[](rlength);
            uint index = 0;
            for (uint256 i = 0; i < length; i++) {
                (
                    address token,
                    uint8[] memory saleType,
                    uint256[] memory info,
                    string memory name,
                    string memory symbol,
                    string memory poolDetails
                ) = IPool(_pools.at(i)).getPoolInfo();
                if(saleType[0] == 0 && info[1] >= block.timestamp){
                    poolInfo[index] = CumulativeLockInfo(
                        _pools.at(i),
                        token,
                        saleType[0],
                        saleType[1],
                        saleType[2],
                        info[0],
                        info[1],
                        info[2],
                        info[3],
                        info[4],
                        info[5],
                        info[6],
                        info[7],
                        info[8],
                        info[9],
                        info[10],
                        info[11],
                        name,
                        symbol,
                        poolDetails
                    );
                index++;
                }
            }
            
            for(uint z=0;z<rlength-1;z++){
                
                for(uint j=0;j<rlength-1;j++){
                    if(poolInfo[j].totalRaised > poolInfo[j+1].totalRaised){
                        (poolInfo[j+1], poolInfo[j]) = (poolInfo[j], poolInfo[j+1]);
                    }
                }
                
            }

            return poolInfo;
        }
        else{
            CumulativeLockInfo[] memory poolInfo = new CumulativeLockInfo[](1);
            return poolInfo;
        }
        
        
    } 

    function getCumulativePoolInfo(uint256 start, uint256 end)
        external
        view
        returns (CumulativeLockInfo[] memory)
    {
        if (end >= _pools.length()) {
            end = _pools.length() - 1;
        }
        uint256 length = end - start + 1;
        CumulativeLockInfo[] memory lockInfo = new CumulativeLockInfo[](length);
        uint256 currentIndex = 0;

        for (uint256 i = start; i <= end; i++) {
            (
                address token,
                uint8[] memory saleType,
                uint256[] memory info,
                string memory name,
                string memory symbol,
                string memory poolDetails
            ) = IPool(_pools.at(i)).getPoolInfo();
            lockInfo[currentIndex] = CumulativeLockInfo(
                _pools.at(i),
                token,
                saleType[0],
                saleType[1],
                saleType[2],
                info[0],
                info[1],
                info[2],
                info[3],
                info[4],
                info[5],
                info[6],
                info[7],
                info[8],
                info[9],
                info[10],
                info[11],
                name,
                symbol,
                poolDetails
            );
            currentIndex++;
        }
        return lockInfo;
    }

    function getUserContributedPoolInfo(
        address userAddress,
        uint256 start,
        uint256 end
    ) external view returns (CumulativeLockInfo[] memory) {
        if (end >= _contributedPoolsOf[userAddress].length()) {
            end = _contributedPoolsOf[userAddress].length() - 1;
        }
        uint256 length = end - start + 1;
        CumulativeLockInfo[] memory lockInfo = new CumulativeLockInfo[](length);
        uint256 currentIndex = 0;
        address user = userAddress;
        for (uint256 i = start; i <= end; i++) {
            (
                address token,
                uint8[] memory saleType,
                uint256[] memory info,
                string memory name,
                string memory symbol,
                string memory poolDetails
            ) = IPool(_contributedPoolsOf[user].at(i)).getPoolInfo();
            lockInfo[currentIndex] = CumulativeLockInfo(
                _pools.at(i),
                token,
                saleType[0],
                saleType[1],
                saleType[2],
                info[0],
                info[1],
                info[2],
                info[3],
                info[4],
                info[5],
                info[6],
                info[7],
                info[8],
                info[9],
                info[10],
                info[11],
                name,
                symbol,
                poolDetails
            );
            currentIndex++;
        }
        return lockInfo;
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
}
