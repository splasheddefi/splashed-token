// SPDX-License-Identifier: MIT

// File: @openzeppelin/contracts/GSN/Context.sol
pragma solidity ^0.7.0;
/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol
pragma solidity ^0.7.0;
/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);
    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);
    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     * Returns a boolean value indicating whether the operation succeeded.
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);
    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);
    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     * Returns a boolean value indicating whether the operation succeeded.
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);
    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     * Returns a boolean value indicating whether the operation succeeded.
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);
    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.7.0;
/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     * Counterpart to Solidity's `+` operator.
     * Requirements:
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
     * Counterpart to Solidity's `-` operator.
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     * Counterpart to Solidity's `-` operator.
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }
    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     * Counterpart to Solidity's `*` operator.
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol
pragma solidity ^0.7.0;
/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }
    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     * Requirements:
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }
    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }
    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     * Requirements:
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }
    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/ERC20.sol
pragma solidity ^0.7.0;
/**
 * @dev Implementation of the {IERC20} interface.
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;
    using Address for address;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) internal _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Sets the values for {name} and {symbol}, initializes {decimals} with
     * a default value of 18.
     * To select a different value for {decimals}, use {_setupDecimals}.
     * All three of these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name_constr, string memory symbol_constr) {
        _name = name_constr;
        _symbol = symbol_constr;
        _decimals = 18;
    }
    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }
    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is
     * called.
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }
    /**
     * @dev See {IERC20-transfer}.
     * Requirements:
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }
    /**
     * @dev See {IERC20-approve}.
     * Requirements:
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
    /**
     * @dev See {IERC20-transferFrom}.
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     * Emits an {Approval} event indicating the updated allowance.
     * Requirements:
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     * Emits an {Approval} event indicating the updated allowance.
     * Requirements:
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     * Emits a {Transfer} event.
     * Requirements:
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _beforeTokenTransfer(sender, recipient, amount);
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     * Emits a {Transfer} event with `from` set to the zero address.
     * Requirements
     * - `to` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");
        _beforeTokenTransfer(address(0), account, amount);
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     * Emits a {Transfer} event with `to` set to the zero address.
     * Requirements
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");
        _beforeTokenTransfer(account, address(0), amount);
        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     * Emits an {Approval} event.
     * Requirements:
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
    function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }
    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     * Calling conditions:
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}

// File: @openzeppelin/contracts/access/Ownable.sol
pragma solidity ^0.7.0;
/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }
    function owner() public view returns (address) {
        return _owner;
    }
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// Transfer Liquidity Uniswap - derived from SAV3 by 4NDR34
pragma solidity ^0.7.0;
abstract contract ERC20TransferLiquidityLock is ERC20, Ownable {
    using SafeMath for uint256;

    event LockLiquidity(uint256 tokenAmount, uint256 ethAmount);

    address public uniswapV2Router;
    address public uniswapV2Pair;

    // receive eth from uniswap swap
    receive () external payable {}

    // Locks liquidity to contract address and sends it to Uniswap Roueter
    function lockLiquidity(uint256 _lockableSupply) private {
        // lockable supply is the token balance of this contract
        require(_lockableSupply <= balanceOf(address(this)), "Requested lock amount higher than lockable balance");
        require(_lockableSupply != 0, "Lock amount cannot be 0");
        // Loackable supply is stored on contract address - Lockable supply is split 50/50 and the half is converted to WETH
        _lockableSupply = balanceOf(address(this));
        uint256 amountToSwapForEth = _lockableSupply.div(2);
        uint256 amountToAddLiquidity = _lockableSupply.sub(amountToSwapForEth);
        // Needed in case contract already owns eth
        uint256 ethBalanceBeforeSwap = address(this).balance;
        swapTokensForEth(amountToSwapForEth);
        uint256 ethReceived = address(this).balance.sub(ethBalanceBeforeSwap);
        // Add liquidity to Uniswap
        addLiquidity(amountToAddLiquidity, ethReceived);
        emit LockLiquidity(amountToAddLiquidity, ethReceived);
    }

    // External util so anyone can provide locked liqudiity to Uniswap
    function provideLiquidityToRouter() external {
        // lock everything that is lockable
        lockLiquidity(balanceOf(address(this)));
    }
    // From Uniswap Router - Swap tokens for WETH
    function swapTokensForEth(uint256 tokenAmount) private {
        address[] memory uniswapPairPath = new address[](2);
        uniswapPairPath[0] = address(this);
        uniswapPairPath[1] = IUniswapV2Router02(uniswapV2Router).WETH();
        _approve(address(this), uniswapV2Router, tokenAmount);
        IUniswapV2Router02(uniswapV2Router)
            .swapExactTokensForETHSupportingFeeOnTransferTokens(
                tokenAmount,
                0,
                uniswapPairPath,
                address(this),
                block.timestamp
            );
    }
    // Adds liquidity to Uniswap
    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        _approve(address(this), uniswapV2Router, tokenAmount);
        IUniswapV2Router02(uniswapV2Router)
            .addLiquidityETH
            {value:ethAmount}(
                address(this),
                tokenAmount,
                0,
                0,
                address(this),
                block.timestamp
            );
    }
    // Returns lockagle supply stored on contract address (in ERC20 Tokens)
    function lockableSupply() external view returns (uint256) {
        return balanceOf(address(this));
    }
    // Returns the locked supply in Tokens
    function lockedSupply() external view returns (uint256) {
        uint256 lpTotalSupply = ERC20(uniswapV2Pair).totalSupply();
        uint256 lpBalance = lockedLiquidity();
        uint256 percentOfLpTotalSupply = lpBalance.mul(1e12).div(lpTotalSupply);
        uint256 uniswapBalance = balanceOf(uniswapV2Pair);
        uint256 _lockedSupply = uniswapBalance.mul(percentOfLpTotalSupply).div(1e12);
        return _lockedSupply;
    }
    // Returns locked liquidity (not Tokens) on contract address
    function lockedLiquidity() public view returns (uint256) {
        return ERC20(uniswapV2Pair).balanceOf(address(this));
    }
}
// Uniswap Router interface
interface IUniswapV2Router02 {
    function WETH() external pure returns (address);
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
}
// Uniswap Factory interface
interface IUniswapV2Pair {
    function sync() external;
}

// Custom token by 4NDR34
pragma solidity ^0.7.1;
contract CustomToken is ERC20TransferLiquidityLock {

    using SafeMath for uint256;

    address[] public stakeholders;
    address[] internal holders;
    address public StakingContract; //= 0xe7A7ef5cb696fdC4E69266B3E1c9A7486159e6aa ;

    mapping(address => uint256) internal stakes;
    mapping(address => uint256) internal rewards;
    mapping(address => referral) private ReferralsOf;

    bool private _mintingFinished = false;

    uint256 private fee;

    // Needed for referrer storage
    struct referral
    {
        address myref;
    }

    // Burn function (from sender address)
    function _burn(uint256 amount) private {
        super._burn(_msgSender(), amount);
    }

    /**
     * @param name Name of the token
     * @param symbol A symbol to be used as ticker
     * @param decimals Number of decimals. All the operations are done using the smallest and indivisible token unit
     * @param cap Maximum number of tokens mintable
     */
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 cap
    )
        ERC20(name, symbol)
    {
        _setupDecimals(decimals);
        _mint(owner(), cap);
        _mintingFinished=true;
    }

    // Set external addresses (Staking contract, uniswapV2Router and uniswapV2Pair) - immutable after setup
    function setUniswapV2Router(address _uniswapV2Router) public onlyOwner {
        require(uniswapV2Router == address(0), "uniswapV2Router already set");
        uniswapV2Router = _uniswapV2Router;
    }
    function setUniswapV2Pair(address _uniswapV2Pair) public onlyOwner {
        require(uniswapV2Pair == address(0), "uniswapV2Pair already set");
        uniswapV2Pair = _uniswapV2Pair;
    }
    function setStakingContract(address _stakingContract) public onlyOwner {
        require(StakingContract == address(0), "StakingContract already set");
        StakingContract = _stakingContract;
    }

    // Stakes creation and management
    function createStake(uint256 _stake)
        public
    {
        super.transfer(StakingContract, _stake);
        if(stakes[msg.sender] == 0) addStakeholder(msg.sender);
        stakes[msg.sender] = stakes[msg.sender].add(_stake);
    }
    function stakeOf(address _stakeholder)
        public
        view
        returns(uint256)
    {
        return stakes[_stakeholder];
    }
    function totalStakes()
        public
        view
        returns(uint256)
    {
        uint256 _totalStakes = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            _totalStakes = _totalStakes.add(stakes[stakeholders[s]]);
        }
        return _totalStakes;
    }

    // Stakeholder and holder creation, management and rewards
    function isStakeholder(address _address)
        public
        view
        returns(bool, uint256)
    {
        for (uint256 s = 0; s < stakeholders.length; s += 1){
            if (_address == stakeholders[s]) return (true, s);
        }
        return (false, 0);
    }
    function isHolder(address _address)
        private
        view
        returns(bool, uint256)
    {
        for (uint256 s = 0; s < holders.length; s += 1){
            if (_address == holders[s]) return (true, s);
        }
        return (false, 0);
    }
    function addStakeholder(address _stakeholder)
        private
    {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if(!_isStakeholder) stakeholders.push(_stakeholder);
    }
    function addHolder(address _holder)
        private
    {
        (bool _isHolder, ) = isHolder(_holder);
        if(!_isHolder) holders.push(_holder);
    }
    function removeHolder(address _holder)
        private
    {
        (bool _isHolder, uint256 s) = isHolder(_holder);
        if(_isHolder){
            holders[s] = holders[holders.length - 1];
            holders.pop();
       }
    }
    function checkHolder(address _address, uint256 _value)
        private
    {
        if (_address!=address(0)) {
            if((balanceOf(_address)-_value)>0) {
                addHolder(_address);
            } else removeHolder(_address);
        }
    }
    function distributeRewardsFee(uint256 value)
        private
    {
        uint256 num = stakeholders.length;
        if (num >0 && totalStakes()!=0){
            for (uint256 s = 0; s < stakeholders.length; s += 1){
                address stakeholder = stakeholders[s];
                super.transfer(stakeholder, value * stakeOf(stakeholder)/totalStakes());
            }
        } else {_burn(value);}
    }
    function distributeHoldFee(uint256 value)
        private
    {
        uint256 num = holders.length;
        if (num !=0){
            for (uint256 s = 0; s < holders.length; s += 1){
                address holder = holders[s];
                super.transfer(holder, value * balanceOf(holder)/(totalSupply()));
            }
        } else {_burn(value);}
    }

    // Refferrer management and rewards
    function referralOf(address userId) public view returns (address){
        return (ReferralsOf[userId].myref);
    }

    function addMyRef(address _ref) private {
        if (address(msg.sender)!=address(this)){
            ReferralsOf[_ref] = referral(msg.sender);
        }
    }
    function payMyRef(uint256 value) private returns (bool) {
        address referrer = referralOf(msg.sender);
        if (referrer != address(0)){
            super.transfer(referrer, value);
        } else if (referrer == address(0)){
           _burn(value);
        }
        return true;
    }

    // Overrides ERC20 mint to avoid inheritance
    function _mint(address to, uint256 value) internal override {
        require (!_mintingFinished);
        super._mint(to, value);
    }

    // Transfer transaction function
    function transfer(address to, uint256 value) public override(ERC20) virtual returns (bool) {
        if (msg.sender == owner()) {fee = 0;}
            else if (msg.sender != owner()) {
                fee = value*4/100;                                                                                              // Set fee as 4% of tx value
                if (uniswapV2Pair != address(0)){
                    require(value <= totalSupply()*1/100, "Max allowed transfer 1% of Total Supply");                           // Set tx cap 1% of total supply
                }
            }
        require (balanceOf(msg.sender) >= value, "Balance is not enough") ;                                                     // Check if the sender has enough balance
        require (balanceOf(to) + value > balanceOf(to));                                                                        // Check for overflows
        _burn(fee/8);                                                                                                           // Burns 0.5% of tx
        if (msg.sender != owner() && msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){                             // Excludes owner and Uniswap from staking
            createStake(fee*25/100);                                                                                            // Stakes 1% of the tx
        } else {_burn(fee*25/100);}                                                                                             // Burns 1% of the tx if sender is Uniswap
        if (balanceOf(to)==0 && msg.sender != owner() && msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){         // Checks if receiver has 0 balance, excludes owner and Uniswap from being referrers
            if (referralOf(to)==address(0) && to != uniswapV2Router && to != uniswapV2Pair){                                                                                    // Check if receiver has no referrers
                addMyRef(to) ;                                                                                                  // Adds referrer (excluding contract address)
            }
        }
        payMyRef(fee/8);                                                                                                        // Pay referrer 0.5% of tx
        distributeRewardsFee(fee*25/100);                                                                                       // Split 1% of tx between stackers (proportional to stakes owned)
        if (msg.sender != owner() && msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){
            checkHolder(msg.sender, value);                                                                                     // Verifies if sender is still Holder after transaction. If not, it's not counted as holder to get reward
        }
        distributeHoldFee(fee/8);                                                                                               // Distribute 0.5% of tx to holders (proportional to balance)
        super.transfer(address(this),fee/8);                                                                                    // Lock 0.5% of tx into this address to be provided as liquidity to uniswap
        super.transfer(to, value-fee);                                                                                          // Transfer the amount - fees paid
        checkHolder(to, -value);                                                                                                // Checks receiver balance after tx and adds it to holder eventually
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public virtual override(ERC20) returns (bool) {
        if (msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){
            fee = value*4/100;                                                                                                  // Set fee as 4% of tx value
            require (balanceOf(msg.sender) >= value) ;                                                                          // Check if the sender has enough balance
            require (balanceOf(to) + value > balanceOf(to));                                                                    // Check for overflows
            if (uniswapV2Pair != address(0)){
                require(value <= totalSupply()*1/100, "Max allowed transfer 1% of Total Supply");
            }
            _burn(fee/8);                                                                                                       // Burns 0.5% of tx
            if (msg.sender != owner() && msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){
                createStake(fee*25/100);
            } else {_burn(fee*25/100);}                                                                                         // Stake 1% of tx
            if (balanceOf(to)==0 && msg.sender != owner() && msg.sender != uniswapV2Pair && msg.sender != uniswapV2Router){
                if (referralOf(to)==address(0)){
                    addMyRef(to) ;
                }                                                                                                               // If balance of receiver is 0 -> check if receiver has referral -> if receive doesn't have referral -> add referral
            }
            payMyRef(fee/8);                                                                                                    // Pay referrer 0.5% of tx
            distributeRewardsFee(fee*25/100);                                                                                   // Split 1% of tx between stackers
            if (msg.sender != owner() && msg.sender != address(this)){
                checkHolder(msg.sender, value);                                                                                 // Verifies if sender is still Holder after transaction. If not, it's not counted as holder to get reward
            }
            distributeHoldFee(fee/8);                                                                                           // Distribute 0.5% of tx to holders
            super.transferFrom(from, address(this),fee/8);                                                                      // Lock 0.5% of tx into this address to be provided as liquidity to uniswap
            super.transferFrom(from, to, value-fee);                                                                            // Transfer the amount - fees paid
            checkHolder(to, -value);                                                                                            // Checks receiver balance after tx and adds it to holder eventually
            return true;
        } else {
            if (uniswapV2Pair != address(0)){
                require(value <= totalSupply()*1/100, "Max allowed transfer 1% of Total Supply");
            }
            _transfer(from, to, value);
            _approve(from, _msgSender(), _allowances[from][_msgSender()].sub(value, "ERC20: transfer amount exceeds allowance"));
            return true;

        }
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override(ERC20) {
        super._beforeTokenTransfer(from, to, amount);
    }
    function _transfer(address from, address to, uint256 amount) internal override {
        super._transfer(from, to, amount);
    }
}
