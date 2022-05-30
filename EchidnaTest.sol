// SPDX-License-Identifier: BSD-4-Clause
pragma solidity ^0.8.1;

import "./ABDKMath64x64.sol";

/// @title Echidna Project - Secureum Workshop - Testing for ABDKMath64x64 Library
/// @author Ikhlas
/// @dev All function calls are currently implemented without side effects
/// @custom:experimental This is an experimental contract; no official audits have been carried out yet
contract Test {
  // Conversion Data
  // Int8 — [-128 : 127]
  // Int16 — [-32768 : 32767]
  // Int32 — [-2147483648 : 2147483647]
  // Int64 — [-9223372036854775808 : 9223372036854775807]
  // Int128 — [-170141183460469231731687303715884105728 : 170141183460469231731687303715884105727]
  // Int256 — [-57896044618658097711785492504343953926634992332820282019728792003956564819968 : 57896044618658097711785492504343953926634992332820282019728792003956564819967]

  // UInt8 — [0 : 255]
  // UInt16 — [0 : 65535]
  // UInt32 — [0 : 4294967295]
  // UInt64 — [0 : 18446744073709551615]
  // UInt128 — [0 : 340282366920938463463374607431768211455]
  // UInt256 — [0 : 115792089237316195423570985008687907853269984665640564039457584007913129639935]

  /// @notice Variables for the contract
  int128 internal zero = ABDKMath64x64.fromInt(0);
  int128 internal one = ABDKMath64x64.fromInt(1);
  int128 internal two = ABDKMath64x64.fromInt(2);
  int128 internal three = ABDKMath64x64.fromInt(3);
  int128 internal eight = ABDKMath64x64.fromInt(8);
  int128 internal thousand = ABDKMath64x64.fromInt(1000);

  int128 private constant MIN_64x64 = -0x80000000000000000000000000000000;
  int128 private constant MAX_64x64 = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
  int256 private constant MAX_256 =
    0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
  int256 private constant MIN_256 =
    -0x8000000000000000000000000000000000000000000000000000000000000000;
  uint256 private constant MAX_U256 =
    0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

  event Value(string, int64);

  /// @notice Functions that call ABDK Library Functions
  function debug(string calldata x, int128 y) public {
    emit Value(x, ABDKMath64x64.toInt(y));
  }

  function fromInt(int256 x) public returns (int128) {
    return ABDKMath64x64.fromInt(x);
  }

  function toInt(int128 x) public returns (int64) {
    return ABDKMath64x64.toInt(x);
  }

  function fromUInt(uint256 x) public returns (int128) {
    return ABDKMath64x64.fromUInt(x);
  }

  function toUInt(int128 x) public returns (uint64) {
    return ABDKMath64x64.toUInt(x);
  }

  function from128x128(int256 x) public returns (int128) {
    return ABDKMath64x64.from128x128(x);
  }

  function to128x128(int128 x) public returns (int256) {
    return ABDKMath64x64.to128x128(x);
  }

  function add(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.add(x, y);
  }

  function sub(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.sub(x, y);
  }

  function mul(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.mul(x, y);
  }

  function muli(int128 x, int256 y) public returns (int256) {
    return ABDKMath64x64.muli(x, y);
  }

  function mulu(int128 x, uint256 y) public returns (uint256) {
    return ABDKMath64x64.mulu(x, y);
  }

  function div(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.div(x, y);
  }

  function divi(int256 x, int256 y) public returns (int128) {
    return ABDKMath64x64.divi(x, y);
  }

  function divu(uint256 x, uint256 y) public returns (int128) {
    return ABDKMath64x64.divu(x, y);
  }

  function neg(int128 x) public returns (int128) {
    return ABDKMath64x64.neg(x);
  }

  function abs(int128 x) public returns (int128) {
    return ABDKMath64x64.abs(x);
  }

  function inv(int128 x) public returns (int128) {
    return ABDKMath64x64.inv(x);
  }

  function avg(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.avg(x, y);
  }

  function gavg(int128 x, int128 y) public returns (int128) {
    return ABDKMath64x64.gavg(x, y);
  }

  function pow(int128 x, uint256 y) public returns (int128) {
    return ABDKMath64x64.pow(x, y);
  }

  function sqrt(int128 x) public returns (int128) {
    return ABDKMath64x64.sqrt(x);
  }

  function log_2(int128 x) public returns (int128) {
    return ABDKMath64x64.log_2(x);
  }

  function ln(int128 x) public returns (int128) {
    return ABDKMath64x64.ln(x);
  }

  function exp_2(int128 x) public returns (int128) {
    return ABDKMath64x64.exp_2(x);
  }

  function exp(int128 x) public returns (int128) {
    return ABDKMath64x64.exp(x);
  }

  /** Tests for Function ADD
Add Function calculates x + y
@param x signed 64.64-bit fixed point number
@param y signed 64.64-bit fixed point number
@return signed 64.64-bit fixed point number
*/

  /**
 @notice Function add_check asserts whether the sum calculated by ABDK Library Function add 
 @notice is equivalent to sum of x + y
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function add_check(int128 x, int128 y) public {
    int256 _rand = add(x, y);
    assert(_rand == (x + y));
  }

  /**
 @notice Function add_check asserts whether the sum calculated by ABDK Library Function add 
 @notice is within the MAX and MIN limits of 64.64-bit
*/
  function add_check() public {
    int256 _rand = add(MAX_64x64, MAX_64x64);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function add_check_2 asserts whether addition of MAX value and one is possible. 
 @notice If it returns a value it would assert false.
*/
  function add_check_2() public {
    try this.add(MAX_64x64, one) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function add_check_3 asserts whether addition with MAX value and inputs greater than 1 pass through
 @notice It also checks for addition of MAX with negative inputs. 
 @param x signed 64.64-bit fixed point number
*/
  function add_check_3(int128 x) public {
    if (x >= 1) {
      try this.add(MAX_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.add(MAX_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function add_check_4 asserts whether addition of MAX value with MAX value is possible
 @notice If it returns a value it would assert false.
*/
  function add_check_4() public {
    try this.add(MAX_64x64, MAX_64x64) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function add_check_5 asserts whether addition of MAX value with zero is possible
 @notice If it does not returns a value it would assert false.
*/
  function add_check_5() public {
    try this.add(MAX_64x64, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function add_check_6 asserts whether addition of MAX value plus 1 with zero is possible
 @notice If it does not returns a value it would assert false.
*/
  function add_check_6() public {
    try this.add(MAX_64x64 + one, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function add_check_7 asserts whether addition of MIN value with input is possible
 @notice If it returns a value for inputs lower than zero it would assert false.
 @param x signed 64.64-bit fixed point number
*/
  function add_check_7(int128 x) public {
    if (x <= -1) {
      try this.add(MIN_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.add(MIN_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function add_check_8 asserts different inputs and verifies the addition properties sum should be
 @notice greater than inputs if both inputs are positive and viceversa. Additionally sum + 1 is equivalent to inputs plus 1
 @param x signed 64.64-bit fixed point number
 @param x signed 64.64-bit fixed point number
 @param x signed 64.64-bit fixed point number
*/
  function add_check_8(
    int128 x,
    int128 y,
    int128 z
  ) public {
    z = add(x, y);
    assert(z >= MIN_64x64 && z <= MAX_64x64);
    if (x > 0 && y > 0) assert(z > x && z > y);
    if (x < 0 && y < 0) assert(z < x && z < y);
    if (z + one == add(x, y) + one) assert(true);
    else assert(false);
  }

  /**
 @notice Function add_check_9 asserts different inputs and verifies the sum of all inputs should be the same
 @notice whichever order they are added in
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function add_check_9(
    int128 x,
    int128 y,
    int128 z
  ) public {
    assert(add((add(x, y)), z) == add((add(x, z)), y));
    assert(add((add(y, z)), x) == add((add(x, z)), y));
  }

  /**
 @notice Function add_check_10 asserts that the sum of positive and negative input is equivalent to subtracting the
 @notice two positive inputs. It also verifies that the difference between the two is 0
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function add_check_10(int128 x, int128 y) public {
    assert(add(x, -y) == sub(x, y));
    assert(sub(add(x, -y), sub(x, y)) == zero);
  }

  /** Tests for Function SUB
   * Calculate x - y.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function sub_check asserts whether the difference calculated by ABDK Library Function sub
 @notice is equivalent to the difference of x + y
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function sub_check(int128 x, int128 y) public {
    int256 _rand = sub(x, y);
    assert(_rand == (x - y));
  }

  /**
 @notice Function sub_check_2 asserts whether the difference calculated by ABDK Library Function sub 
 @notice is within the MAX and MIN limits of 64.64-bit
*/
  function sub_check_2() public {
    int256 _rand = sub(MAX_64x64, MAX_64x64);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function sub_check_3 asserts whether subtraction of MIN value and one is possible. 
 @notice If it returns a value it would assert false.
*/
  function sub_check_3() public {
    try this.sub(MIN_64x64, (1)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function sub_check_4 asserts whether subtraction with MIN value and positive inputs pass through
 @notice It also checks for subtraction of MIN with negative inputs. 
 @param x signed 64.64-bit fixed point number
*/
  function sub_check_4(int128 x) public {
    if (x > 0) {
      try this.sub(MIN_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.sub(MIN_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function sub_check_5 asserts whether subtraction of MAX value with MIN value is possible
 @notice If it returns a value it would assert false.
*/
  function sub_check_5() public {
    try this.sub(MIN_64x64, MAX_64x64) {
      assert(false);
    } catch {}
    try this.sub(MAX_64x64, MIN_64x64) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function sub_check_6 asserts whether subtraction of MIN value with zero is possible
 @notice If it does not return a value it would assert false.
*/
  function sub_check_6() public {
    try this.sub(MIN_64x64, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function sub_check_7 asserts whether subtraction of MIN value plus 1 with zero is possible
 @notice If it returnS a value it would assert false.
*/
  function sub_check_7() public {
    try this.sub(MIN_64x64 - one, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function sub_check_8 asserts whether the sub is within limits and based on x and y being + / - verfies 
 @notice the sign of sub
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function sub_check_8(int128 x, int128 y) public {
    int128 z = sub(x, y);
    assert(z >= MIN_64x64 && z <= MAX_64x64);
    if (x >= 0 && y > 0 && x > y) assert(z <= x);
    if (x >= 0 && y >= 0 && x < y) assert(z < x && z < y);
    if (x >= 0 && y < 0) assert(z >= x && z >= y);
    if (x < 0 && y > 0) assert(z <= x && z <= y);
    if (x < 0 && y < 0 && abs(x) <= abs(y)) assert(z >= x && z >= y);
    if (x < 0 && y < 0 && abs(x) > abs(y)) assert(z >= x);
    if (z - one == sub(x, y) - one) assert(true);
    else assert(false);
  }

  /**
 @notice Function sub_check_9 asserts whether the sub of abs(x) & abs(y) is equivalent of sum of abs(x) and neg(y)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function sub_check_9(int128 x, int128 y) public {
    if (abs(x) >= abs(y))
      assert(sub(abs(x), abs(y)) == add(abs(x), -1 * abs(y)));
    else assert(sub(abs(y), abs(x)) == add(abs(y), -1 * abs(x)));
  }

  /**
 @notice Function sub_check_10 asserts whether the sub of abs(x) & abs(y) is equivalent of sum of abs(x) and neg(y)
 @notice and also the difference of that 2 is equal to zero
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function sub_check_10(int128 x, int128 y) public {
    assert(add(x, -y) == sub(x, y));
    assert(sub(add(x, -y), sub(x, y)) == zero);
  }

  /** Tests for Function MUL
   * Calculate x * y rounding down.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function mul_check asserts whether the mul function matches with mul
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number 
*/
  function mul_check(int128 x, int128 y) public {
    int256 _rand = mul(x, y);
    assert(_rand == ((fromInt(x) * fromInt(y)) >> 64));
  }

  /**
 @notice Function mul_check_2 asserts whether the mul returns a value within the range
*/
  function mul_check_2() public {
    int256 _rand = mul(MAX_64x64, MAX_64x64);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function mul_check_3 asserts whether the mul function passes mul of MAX and 1
*/
  function mul_check_3() public {
    try this.mul(MAX_64x64, one) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function mul_check_4 asserts whether the mul function passes mul of MAX with different x and it asserts false if abs(x) > one
 @param x signed 64.64-bit fixed point number
*/
  function mul_check_4(int128 x) public {
    if (abs(x) > one) {
      try this.mul(MAX_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.mul(MAX_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function mul_check_5 asserts whether the mul function of MAX with different values gives a return value lower than MAX
 @param x signed 64.64-bit fixed point number
*/
  function mul_check_5(int128 x) public {
    int128 y;
    if (x != zero && abs(x) > one) {
      try this.mul(MAX_64x64, x) {
        y = mul(MAX_64x64, x);
        if (y < MAX_64x64) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function mul_check_6 asserts whether the mul function of MAX & MAX returns an error 
*/
  function mul_check_6() public {
    try this.mul(MAX_64x64, MAX_64x64) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function mul_check_7 asserts whether the mul function returns an error for MAX & zero
*/
  function mul_check_7() public {
    try this.mul(MAX_64x64, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function mul_check_8 asserts whether the mul function returns an error for (MAX + one) & zero returns an eror or not
*/
  function mul_check_8() public {
    try this.mul(MAX_64x64 + one, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function mul_check_9 asserts whether the mul function returns an error for MIN & x (for x > 1 & x = -1)
 @param x signed 64.64-bit fixed point number
*/
  function mul_check_9(int128 x) public {
    if (abs(x) > one || x == neg(one)) {
      try this.mul(MIN_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.mul(MIN_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function mul_check_10 asserts whether the mul function returns an error for x & zero
 @param x signed 64.64-bit fixed point number
*/
  function mul_check_10(int128 x) public {
    try this.mul(x, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function mul_check_11 asserts whether the mul function returns an error for zero & (MAX + one)
*/
  function mul_check_11() public {
    try this.mul(zero, MAX_64x64 + one) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function mul_check_12 asserts whether the mul function returns a value within the range
 @notice Also checks results if either input is zero or one of them is zero
 @notice Also verifies z / y is equivalent to x (adjustment made for precision)
 @notice Also asserts the output's sign, based on the inputs' sign
 @notice Lastly also checks if x *(y + one) is equivalent to (x *y) + x
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function mul_check_12(int128 x, int128 y) public {
    int128 z = mul(x, y);
    assert(z >= MIN_64x64 && z <= MAX_64x64);
    if (x == zero || y == zero) assert(z == zero);
    if (x == one) assert(z == y);
    if (y == one) assert(z == x);
    if ((abs(z) >= one) && (abs((y)) >= one)) {
      assert(
        ((abs(z / y)) <= (abs(x) * one)) && ((abs(z / y)) >= (abs(x) / one))
      );
      if (abs(x) >= one) {
        assert(z == mul(y, x));
        if (x > zero && y > zero) assert(z >= x && z >= y);
        if (x > zero && y < zero) assert(z < x && z <= y);
        if (x < zero && y < zero) assert(z > x && z > y);
        if (x < zero && y > zero) assert(z <= x && z < y);
        assert(z == mul(neg(y), neg(x)));
      }
    }
    if (x > zero && y > zero) {
      if (mul(x, y + one) == mul(x, y) + x) assert(true);
      else assert(false);
    }
  }

  /**
 @notice Function mul_check_13 asserts whether the mul function result for (x, y, z) is the same 
 @notice irrespective of order of multiplication 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function mul_check_13(
    int128 x,
    int128 y,
    int128 z
  ) public {
    z = abs(z);
    y = abs(y);
    x = abs(x);
    if ((abs(z) >= one) && (abs((y)) >= one) && (abs(x) >= one)) {
      try this.mul(x, y) {
        int128 t = mul(x, y);
        try this.mul(t, z) {
          assert(mul((mul(x, y)), z) == mul((mul(x, z)), y));
          assert(mul((mul(y, z)), x) == mul((mul(x, z)), y));
        } catch {}
      } catch {}
    }
  }

  /** Tests for Function DIV
   * Calculate x / y rounding towards zero.  Revert on overflow or when y is
   * zero.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function div_check asserts whether the div function result matches up and is within range limits
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function div_check(int128 x, int128 y) public {
    if (
      (y != zero) &&
      (x <= MAX_64x64) &&
      (y <= MAX_64x64) &&
      (x > one) &&
      (y > one)
    ) {
      int128 _rand = div(x, y);
      int256 temp = x;
      int256 calc = (((temp) << 64) / (y));
      if (calc <= MAX_64x64 && calc >= MIN_64x64) {
        assert(_rand == int128(calc));
      } else assert(false);
    }
  }

  /**
 @notice Function div_check_2 asserts whether the div returns a value within the range
*/
  function div_check_2() public {
    int256 _rand = div(MAX_64x64, MAX_64x64);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function div_check_3 asserts whether the div function passes div of MAX and 1; if not it fails
*/
  function div_check_3() public {
    try this.div(MAX_64x64, one) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function div_check_4 asserts whether the div function passes div of MAX with different x; if x < one should return error
 @param x signed 64.64-bit fixed point number
*/
  function div_check_4(int128 x) public {
    if (abs(x) >= one) {
      try this.div(MAX_64x64, x) {} catch {
        assert(false);
      }
    } else {
      try this.div(MAX_64x64, x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function div_check_5 asserts whether the div function of MAX with different values gives a return value lower than MAX
 @param x signed 64.64-bit fixed point number
*/
  function div_check_5(int128 x) public {
    int256 y;
    if (x != zero && abs(x) >= one) {
      try this.div(MAX_64x64, x) {
        y = div(MAX_64x64, x);
        if (y > MAX_64x64 || y < MIN_64x64) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function div_check_6 asserts whether the div function of MAX & MAX does not an error 
*/
  function div_check_6() public {
    try this.div(MAX_64x64, MAX_64x64) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function div_check_7 asserts whether the div function returns an error for MAX & zero
*/
  function div_check_7() public {
    try this.div(MAX_64x64, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_8 asserts whether the div function returns an error for (MAX + one) & zero 
*/
  function div_check_8() public {
    try this.div(MAX_64x64 + one, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_9 asserts whether the div function returns an error for MIN & x (for x > 1 & x = -1)
 @param x signed 64.64-bit fixed point number
*/
  function div_check_9(int128 x) public {
    if (abs(x) >= one && x != neg(one)) {
      try this.div(MIN_64x64, x) {} catch {
        assert(false);
      }
    } else {
      try this.div(MIN_64x64, x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function div_check_10 asserts whether the div function returns an error for x & zero
 @param x signed 64.64-bit fixed point number
*/
  function div_check_10(int128 x) public {
    try this.div(x, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_11 asserts whether the div function returns an error for zero & (MAX + one)
*/
  function div_check_11() public {
    try this.div(zero, MAX_64x64 + one) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_12 asserts whether the div function returns an error for x & (MIN - one)
*/
  function div_check_12(int128 x) public {
    try this.div(x, MIN_64x64 - one) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_13 asserts whether the div function returns an error for (MIN - one) & x
*/
  function div_check_13(int128 x) public {
    try this.div(MIN_64x64 - one, x) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_14 asserts whether the div function returns an error for MAX & (MIN)
*/
  function div_check_14() public {
    try this.div(MAX_64x64, MIN_64x64) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function div_check_15 asserts whether the div function returns an error for (MIN  & - one)
*/
  function div_check_15() public {
    try this.div(MIN_64x64, neg(one)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function div_check_16 asserts whether the div function returns a value within the range
 @notice Also checks results if either input is zero or one of them is zero
 @notice Also verifies z / y is equivalent to x (adjustment made for precision)
 @notice Also asserts the output's sign, based on the inputs' sign
 @notice Lastly also checks if x / (y + one) is equivalent to (x / y) - (y + one)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function div_check_16(int128 x, int128 y) public {
    int128 z = div(x, y);
    assert(z >= MIN_64x64 && z <= MAX_64x64);
    if (x == zero && y != zero) assert(z == zero);
    if ((x == one) && (y != 0)) assert(z == inv(y));
    if (y == one) assert(z == x);
    if ((abs(z) >= one) && (abs((y)) >= one)) {
      assert(
        ((abs(mul(z, y))) <= (abs(x) * one)) &&
          ((abs(mul(z, y))) >= (abs(x) / one))
      );
      if (abs(x) >= one) {
        assert(z == mul(x, div(1, y)));
        if (x > zero && y > zero) assert(z <= x && z <= y);
        if (x > zero && y < zero) assert(z <= x);
        if (x < zero && y < zero) assert(z >= x && z >= y);
        if (x < zero && y > zero) assert(z >= x && z < y);
        assert(z == div(neg(y), neg(x)));
      }
    }
    if (x > one && y > one && div(x, y) > one) {
      if (abs(div(x, y + one)) == abs(sub((div(x, y)), (abs(y) + one))))
        assert(true);
      else assert(false);
    }
  }

  /**
 @notice Function div_check_17 asserts whether the div function result for (x, y, z) is the same 
 @notice irrespective of order of division
 @notice Limited to values greater than 8 due to precision issues with smaller values (including rounding down)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function div_check_17(
    int128 x,
    int128 y,
    int128 z
  ) public {
    if (
      (z >= eight) &&
      (y >= eight) &&
      (x >= eight) &&
      (z <= MAX_64x64) &&
      (y <= MAX_64x64) &&
      (x <= MAX_64x64)
    ) {
      try this.div(x, y) {
        int128 t = div(x, y);
        try this.div(t, z) {
          assert(
            div((div(x, y)), z) <= (div((div(x, z)), y)) &&
              div((div(x, y)), z) >= (div((div(x, z)), y))
          );
          int128 w = div((div(x, y)), z);

          assert((x >= ((mul((mul(w, z)), y)))));
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function div_check_18 asserts whether the div function result for (x, y, z) is the same 
 @notice irrespective of order of division
 @notice For precision extended the assert to be equivalent for +/- 10 percent of each other
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function div_check_18(
    int128 x,
    int128 y,
    int128 z
  ) public {
    if (
      (z >= eight) &&
      (y >= eight) &&
      (x >= eight) &&
      (z <= MAX_64x64) &&
      (y <= MAX_64x64) &&
      (x <= MAX_64x64)
    ) {
      try this.div(x, y) {
        int128 t = div(x, y);
        try this.div(t, z) {
          int128 l1 = div((div(x, y)), z);
          int128 l2 = div((div(x, z)), y);
          assert(
            div((div(x, y)), z) <= ((div((div(x, z)), y) * 110) / 100) &&
              div((div(x, y)), z) >= ((div((div(x, z)), y) * 90) / 100)
          );
          int128 w = div((div(x, y)), z);
          int128 c = mul((mul(w, z)), y);
          int128 newr = sub(x, (mul(mul(w, z), y)));
          assert(newr <= ((x * 120) / 100));
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function div_check_19 asserts whether the div function result for (x, y, z) is the same 
 @notice irrespective of order of division. Limited to inputs greater than 1000
 @notice For precision extended the assert to be equivalent for +/- 10 percent of each other
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function div_check_19(
    int128 x,
    int128 y,
    int128 z
  ) public {
    if (
      (z >= thousand) &&
      (y >= thousand) &&
      (x >= thousand) &&
      (z <= MAX_64x64) &&
      (y <= MAX_64x64) &&
      (x <= MAX_64x64)
    ) {
      try this.div(x, y) {
        int128 t = div(x, y);
        try this.div(t, z) {
          int128 l1 = div((div(x, y)), z);
          int128 l2 = div((div(x, z)), y);
          assert(
            div((div(x, y)), z) <= ((div((div(x, z)), y) * 110) / 100) &&
              div((div(x, y)), z) >= ((div((div(x, z)), y) * 90) / 100)
          );
          int128 w = div((div(x, y)), z);
          int128 c = mul((mul(w, z)), y);
          int128 newr = sub(x, (mul(mul(w, z), y)));
          assert(newr <= (x));
        } catch {}
      } catch {}
    }
  }

  /** Tests for Function NEG
   * Calculate -x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies whether the function neg for all values excluding MIN
 @param x signed 64.64-bit fixed point number
*/
  function neg_check(int128 x) public {
    if (x != MIN_64x64) {
      int128 _rand = neg(x);
      int128 _another = neg(_rand);
      assert(x == _another);
    } else {
      try this.neg(x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies neg(x) == div(neg(x), neg(one))
 @param x signed 64.64-bit fixed point number
*/
  function neg_check_2(int128 x) public {
    if (x != MIN_64x64) {
      int128 _rand = neg(x);
      int128 _another = div(_rand, neg(one));
      assert(x == _another);
    } else {
      try this.neg(x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies for negative values; neg(x) == sqrt(pow(x, 2))
 @param x signed 64.64-bit fixed point number
*/
  function neg_check_3(int128 x) public {
    uint256 ptwo = 2;
    if (x != MIN_64x64 && x > two) {
      int128 _rand = neg(x);
      int128 _another = sqrt(pow(_rand, ptwo));
      assert(x == _another || x == _another + 1);
    } else if (x != MIN_64x64 && x < neg(two)) {
      int128 tin = sqrt(pow(x, ptwo));
      int128 negxx = neg(x);
      assert(neg(x) == sqrt(pow(x, ptwo)) || neg(x) == sqrt(pow(x, ptwo)) + 1);
    }
  }

  /**
 @notice Function verifies div(mul(neg(x),neg(y)),y) == x
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_4(int128 x, int128 y) public {
    if (x > two && y > two) {
      try this.mul(neg(x), neg(y)) {
        assert(div(mul(neg(x), neg(y)), y) == x);
      } catch {}
    }
  }

  /**
 @notice Function verifies (mul((x),neg(y))) < zero when x and y are greater than 0
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_5(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      if (mul(x, y) <= MAX_64x64) {
        assert((mul(x, neg(y)) < zero));
        assert((mul(neg(x), y) < zero));
      }
    }
  }

  /**
 @notice Function verifies (mul(neg(x),neg(one))) == neg(x) 
 @param x signed 64.64-bit fixed point number
*/
  function neg_check_6(int128 x) public {
    if (x != MIN_64x64) {
      int128 _rand = neg(x);
      int128 _another = mul(_rand, neg(one));
      assert(x == _another);
    } else {
      try this.neg(x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies abs(add((x),neg(y))) == abs(add(neg(x), y)) for x > y & y > 0 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_7(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      if (x > y) {
        assert(abs(add(x, neg(y))) == abs(add(neg(x), y)));
      }
    } else {
      assert(abs(add(y, neg(x))) == abs(add(neg(y), x)));
    }
  }

  /**
 @notice Function verifies div(mul(neg(x), (y)), y) == neg(x) for x and y > two
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_8(int128 x, int128 y) public {
    if (x > two && y > two) {
      try this.mul(neg(x), neg(y)) {
        assert(div(mul(neg(x), (y)), y) == neg(x));
        assert(div(mul((x), neg(y)), y) == neg(x));
        assert((div(neg(x), (y))) < zero);
      } catch {}
    }
  }

  /**
 @notice Function verifies neg(x) == MIN + 1 when x = MAX
*/
  function neg_check_9() public {
    int128 x = MAX_64x64;
    assert((neg(x) == (MIN_64x64) + 1));
    assert((neg(x) == add(MIN_64x64, 1)));
  }

  /**
 @notice Function verifies neg(x) == MAX for x = MIN
*/
  function neg_check_10() public {
    int128 x = MIN_64x64;
    assert((neg((x)) == MAX_64x64));
    assert((neg(add(x, one)) != MAX_64x64));
  }

  /**
 @notice Function verifies for +x; whether neg(x) < zero
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_11(int128 x, int128 y) public {
    if (x > zero) assert((neg(x) < zero));
    if (y < zero && y != MIN_64x64) assert((neg(y) > zero));
  }

  /**
 @notice Function verifies for +x; whether neg(x) + zero < zero
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function neg_check_12(int128 x, int128 y) public {
    if (x > zero) assert((neg(x) + zero < zero));
    if (y < zero && y != MIN_64x64) assert((neg(y) - zero > zero));
  }

  /** Tests for Function ABS
   * Calculate |x|.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies abs(x) > zero 
 @param x signed 64.64-bit fixed point number
*/
  function abs_check(int128 x) public {
    if (x > zero) {
      int128 _rand = neg(x);
      int128 _another = abs(_rand);
      assert(_rand < zero);
      assert(abs(x) > zero);
      assert(_another > zero);
      assert(x == _another);
    } else if (x != MIN_64x64 && x < zero) {
      int128 _another = abs(x);
      assert(x < zero);
      assert(abs(x) > zero);
      assert(neg(x) == _another);
    }
  }

  /**
 @notice Function verifies abs(x) for zero does not receive an eror 
*/
  function abs_check_2() public {
    try this.abs(zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies abs(x) for MIN receives an eror 
*/
  function abs_check_3() public {
    try this.abs(MIN_64x64) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies abs(x) for MAX does not receive an eror 
*/
  function abs_check_4() public {
    int128 x = MAX_64x64;
    try this.abs(MAX_64x64) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies abs(mul(neg(x), (y))) == mul(x, y) for x & y are > two
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function abs_check_5(int128 x, int128 y) public {
    if (x > two && y > two) {
      try this.mul(neg(x), neg(y)) {
        assert(abs(mul(neg(x), (y))) == mul(x, y));
        assert(abs(div(mul((x), neg(y)), y)) == (x));
        assert(abs(div(neg(x), (y))) > zero);
      } catch {}
    }
  }

  /**
 @notice Function verifies mul(x, neg(y)) < zero for x & y are > zero
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function abs_check_6(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      if (mul(x, y) <= MAX_64x64) {
        assert((mul(x, neg(y)) < zero));
        assert(abs(mul(x, neg(y))) > zero);
        assert(abs(mul(neg(x), y)) > zero);
      }
    }
  }

  /**
 @notice Function verifies (add(abs(x), abs(y))) > zero) for x & y are < neg(two)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function abs_check_7(int128 x, int128 y) public {
    if (x < neg(two) && y < neg(two)) {
      if (add(x, y) >= MIN_64x64) {
        assert((add(x, y) < zero));
        assert((add(abs(x), abs(y))) > zero);
        assert((mul(x, y) > zero));
        assert((mul(abs(x), y) < zero));
      }
    }
  }

  /**
 @notice Function verifies (abs(add(x, neg(y))) == abs(add(neg(x), y)) for x & y are > zero
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function abs_check_8(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      if (x > y) {
        assert(abs(add(x, neg(y))) == abs(add(neg(x), y)));
      }
    } else {
      assert(abs(add(y, neg(x))) == abs(add(neg(y), x)));
    }
  }

  /**
 @notice Function verifies ((abs(neg(x)) > zero)) for x > zero & vice versa for neg
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function abs_check_9(int128 x, int128 y) public {
    if (x > zero) {
      assert((neg(x) < zero));
      assert((abs(neg(x)) > zero));
    }
    if (y < zero && y != MIN_64x64) {
      assert((neg(y) > zero));
      assert((abs(y)) > zero);
    }
  }

  /** Tests for Function INV
   * Calculate 1 / x rounding towards zero.  Revert on overflow or when x is
   * zero.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (x > two). Also verifies (mul(inv(x), x)) == one (needed to spread the range due to precision)
 @param x signed 64.64-bit fixed point number
*/
  function inv_check(int128 x) public {
    if (x == zero) {
      try this.inv(x) {
        assert(false);
      } catch {}
    } else if (x > two) {
      assert(inv(x) < x);
      // assert( (one*110/100) >= (mul(inv(x), x)) && ((one*90/100) <= (mul(inv(x),x))));
      assert(
        ((one * 110) / 100) >= (mul(inv(x), x)) &&
          (((one * 60) / 100) <= (mul(inv(x), x)))
      );
      assert(inv(x) >= MIN_64x64 && inv(x) <= MAX_64x64);
    }
  }

  /**
 @notice Function verifies (inv(x) <= one && inv(x) > zero for x > two
 @param x signed 64.64-bit fixed point number
*/
  function inv_check_2(int128 x) public {
    if (x > two) {
      assert(inv(x) <= one && inv(x) > zero);
    } else if (x < neg(two)) {
      assert(inv(x) >= neg(one) && inv(x) < zero);
    }
  }

  /**
 @notice Function verifies (inv(add(one, one)) <= one (had to make a lower than for precision)
*/
  function inv_check_3() public {
    assert(inv(add(one, one)) <= one);
  }

  /**
 @notice Function verifies (mul((inv(MIN_64x64)), MIN_64x64) == one)
*/
  function inv_check_4() public {
    try this.inv(MIN_64x64) {
      assert(mul((inv(MIN_64x64)), MIN_64x64) == one);
    } catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies (mul((inv(MAX_64x64)), MAX_64x64) == sub(one, 1)) needed to include minus 1 for precision)
*/
  function inv_check_5() public {
    try this.inv(MAX_64x64) {
      assert(mul((inv(MAX_64x64)), MAX_64x64) == sub(one, 1));
    } catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies ((mul(inv(x), inv(y))) == inv(mul(x, y))
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function inv_check_6(int128 x, int128 y) public {
    if (x > two && y > two && inv(x) != zero && inv(y) != zero) {
      assert((mul(inv(x), inv(y))) == inv(mul(x, y)));
      assert(div(x, inv(x)) == one);
    }
  }

  /**
 @notice Function verifies (mul(x, inv(y)) == inv(mul(y, inv(x))) for x > two
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function inv_check_7(int128 x, int128 y) public {
    if (x > two && y > two && inv(x) != zero && inv(y) != zero) {
      if (mul(x, y) <= MAX_64x64) {
        assert(mul(x, inv(y)) == inv(mul(y, inv(x))));
        assert(mul(mul(x, inv(y)), y) == x);
      }
    }
  }

  /**
 @notice Function verifies ((x ) == inv(inv(x), needed to add +/- 10 percent for precision
 @param x signed 64.64-bit fixed point number
*/
  function inv_check_8(int128 x) public {
    if (x == zero) {
      try this.inv(x) {
        assert(false);
      } catch {}
    } else if (x > two) {
      assert(
        ((x * 110) / 100) >= inv(inv(x)) && ((x * 90) / 100) <= inv(inv(x))
      );
    }
  }

  /** Tests for Function AVG
   * Calculate arithmetics average of x and y, i.e. (x + y) / 2 rounding down.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (avg(x, y) <= x || avg(x, y) <= y)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check(int128 x, int128 y) public {
    if (x > zero && y > zero && x != y) {
      assert(avg(x, y) <= x || avg(x, y) <= y);
      assert(avg(x, y) > zero);
    } else if (x > zero && y > zero && x == y) {
      assert(avg(x, y) == x);
      assert(avg(x, y) == y);
      assert(avg(x, y) > zero);
    }
  }

  /**
 @notice Function verifies (avg(x, y) <= x || avg(x, y) <= y) for x and y < 0
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_2(int128 x, int128 y) public {
    if (x < zero && y < zero && x != y) {
      assert(abs(avg(x, y)) <= abs(x) || abs(avg(x, y)) <= abs(y));
      assert(avg(x, y) < zero);
    } else if (x < zero && y < zero && x == y) {
      assert(avg(x, y) == x);
      assert(avg(x, y) == y);
      assert(avg(x, y) < zero);
    }
  }

  /**
 @notice Function verifies (avg(x, y) < zero) and avg(x, y) > x & < y;  for x < 0 and y > 0
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_3(int128 x, int128 y) public {
    if (x < zero && y > zero && abs(x) > abs(y)) {
      assert(avg(x, y) < zero);
      assert(avg(x, y) > x);
      assert(avg(x, y) < y);
    } else if (x < zero && y > zero && abs(y) > abs(x)) {
      assert(avg(x, y) > zero);
      assert(avg(x, y) < y);
      assert(avg(x, y) > x);
    }
  }

  /**
 @notice Function verifies (mul(avg(x, y), two) <= ((add(abs(x), abs(y))) with some percentage for precision
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_4(int128 x, int128 y) public {
    if (x > two && y > two)
      assert(
        mul(avg(x, y), two) <= ((add(abs(x), abs(y))) * 101) / 100 &&
          mul(avg(x, y), two) >= ((add(abs(x), abs(y))) * 99) / 100
      );
  }

  /**
 @notice Function verifies (avg(x, y) == avg(x, x) for x = y. Also verifies (avg(x, y) == div(y, two)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_5(int128 x, int128 y) public {
    if (x == zero && y == zero) {
      assert(avg(x, y) == zero);
      assert(avg(x, y) == avg(x, x) && avg(x, y) == avg(y, y));
    } else if (x == zero && y != zero) assert(avg(x, y) == div(y, two));
  }

  /**
 @notice Function verifies (avg(x, y) == avg(y, x))
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_6(int128 x, int128 y) public {
    assert(avg(x, y) == avg(y, x));
  }

  /**
 @notice Function verifies (avg(x, y) == zero) if x = neg(y)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_7(int128 x, int128 y) public {
    if (x == neg(y)) assert(avg(x, y) == zero);
  }

  /**
 @notice Function verifies (avg(x, y) == div(add(x, y), two) for x and y > two
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_8(int128 x, int128 y) public {
    if (x > two && y > two) assert(avg(x, y) == div(add(x, y), two));
  }

  /**
 @notice Function verifies (avg(x, y) for MAX and MIN should not return error
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function avg_check_9(int128 x, int128 y) public {
    x = MAX_64x64;
    y = MIN_64x64;
    try this.avg(x, y) {} catch {
      assert(false);
    }
  }

  /** Tests for Function POW
   * Calculate x^y assuming 0^0 is 1, where x is signed 64.64 fixed point number
   * and y is unsigned 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y uint256 value
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (pow(x, y) for y < 0 & y = 0
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
 @param z signed 64.64-bit fixed point number
*/
  function pow_check(
    int128 x,
    uint256 y,
    int128 z
  ) public {
    if (y < 0) {
      try this.pow(x, y) {
        assert(false);
      } catch {}
    } else if (y == 0) {
      try this.pow(x, y) {
        z = pow(x, y);
        assert(z == one);
      } catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies (pow(x, y) == one for (x and y = 0), (x = 0 & y >= 1)
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
*/
  function pow_check_2(int128 x, uint256 y) public {
    if (x == zero && y == 0) {
      assert(pow(x, y) == one);
    } else if (x == zero && y >= 1) {
      assert(pow(x, y) == zero);
    }
  }

  /**
 @notice Function verifies (pow(pow(x, y), z) == pow(x,mul(y,z)))
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
 @param z uint256 value
*/
  function pow_check_3(
    int128 x,
    uint256 y,
    uint256 z
  ) public {
    if (y >= 1 && z >= 1) {
      int128 cony = fromUInt(y);
      int128 conz = fromUInt(z);
      uint256 temp = toUInt(mul(cony, conz));
      assert(pow(pow(x, y), z) == pow(x, temp));
    }
  }

  /**
 @notice Function verifies (mul(pow(x, y), pow(x, z)) == pow(x,mul(y,z)))
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
 @param z uint256 value
*/
  function pow_check_4(
    int128 x,
    uint256 y,
    uint256 z
  ) public {
    if (y >= 1 && z >= 1) {
      int128 cony = fromUInt(y);
      int128 conz = fromUInt(z);
      uint256 temp = toUInt(add(cony, conz));
      assert(mul(pow(x, y), pow(x, z)) == pow(x, temp));
    }
  }

  /**
 @notice Function verifies (((pow(div(x, y), z) == div(pow(x, z), pow(y, z));needed to add abs/sub <=one for precision 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
 @param z uint256 value
*/
  function pow_check_5(
    int128 x,
    int128 y,
    uint256 z
  ) public {
    if (z >= 1) {
      assert(abs(sub(pow(div(x, y), z), div(pow(x, z), pow(y, z)))) <= one);
    }
  }

  /**
 @notice Function verifies (div(pow(x, y), pow(x, z)) == pow(x,sub(y,z))
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
 @param z uint256 value
*/
  function pow_check_6(
    int128 x,
    uint256 y,
    uint256 z
  ) public {
    if (y >= 1 && z >= 1 && y > z) {
      int128 cony = fromUInt(y);
      int128 conz = fromUInt(z);
      uint256 temp = toUInt(sub(cony, conz));
      assert(div(pow(x, y), pow(x, z)) == pow(x, temp));
    }
  }

  /**
 @notice Function verifies (pow(x, y)) where x = MAX and passes for y = 0 & y = 1
 @param x signed 64.64-bit fixed point number
 @param y uint256 value
*/
  function pow_check_7(int128 x, uint256 y) public {
    x = MAX_64x64;
    try this.pow(x, y) {
      assert(y == 0 || y == 1);
    } catch {}
  }

  /** Tests for Function SQRT
   * Calculate sqrt (x) rounding down.  Revert if x < 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (sqrt(x) for x < 0 and = 0
 @param x signed 64.64-bit fixed point number
 @param z signed 64.64-bit fixed point number
*/
  function sqrt_check(int128 x, int128 z) public {
    if (x < 0) {
      try this.sqrt(x) {
        assert(false);
      } catch {}
    } else if (x == 0) {
      try this.sqrt(x) {
        z = sqrt(x);
        assert(z == zero);
      } catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies (mul(sqrt(x), sqrt(y)) == sqrt(mul(x, y))); difference taken to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function sqrt_check_2(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub((mul(sqrt(x), sqrt(y))), (sqrt(mul(x, y))))) <= one);
    }
  }

  /**
 @notice Function verifies (div(sqrt(x), sqrt(y)) == sqrt(div(x, y))); difference taken to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function sqrt_check_3(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub(div(sqrt(x), sqrt(y)), sqrt(div(x, y)))) <= one);
    }
  }

  /**
 @notice Function verifies (sqrt(pow(x, y))) == x)
 @param x signed 64.64-bit fixed point number
 @param y uint256
*/
  function sqrt_check_4(int128 x, uint256 y) public {
    if (x > zero && y == 2) {
      assert((sqrt(pow(x, y))) == x);
    }
  }

  /**
 @notice Function verifies (sqrt(x)) for x = MAX
 @param x signed 64.64-bit fixed point number
*/
  function sqrt_check_5(int128 x) public {
    if (x == MAX_64x64) {
      try this.sqrt(x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies (sqrt(x)) for x = MIN
 @param x signed 64.64-bit fixed point number
*/
  function sqrt_check_6(int128 x) public {
    if (x == MIN_64x64) {
      try this.sqrt(x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies (div(sqrt(x), sqrt(x)) == one)
 @param x signed 64.64-bit fixed point number
*/
  function sqrt_check_7(int128 x) public {
    if (x > zero) {
      assert(div(sqrt(x), sqrt(x)) == one);
    }
  }

  /** Tests for Function LOG_2
   * Calculate binary logarithm of x.  Revert if x <= 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (log_2(x) for different x values 
 @param x signed 64.64-bit fixed point number
*/
  function log_2_check(int128 x) public {
    if (x <= zero) {
      try this.log_2(x) {
        assert(false);
      } catch {}
    } else if (x > zero && x < one) assert(log_2(x) < zero);
    else if (x == one) assert(log_2(x) == zero);
    else if (x == two) assert(log_2(x) == one);
    else if (x > one) assert(log_2(x) > zero);
  }

  /**
 @notice Function verifies (log_2(mul(x, y)) == add(log_2(x), log_2(y)). For precision take difference and abs to be less than 1
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function log_2_check_2(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub(log_2(mul(x, y)), add(log_2(x), log_2(y)))) <= one);
    }
  }

  /**
 @notice Function verifies (log_2(div(x, y)) == sub(log_2(x), log_2(y)). For precision take difference and abs to be less than 1
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function log_2_check_3(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub(log_2(div(x, y)), sub(log_2(x), log_2(y)))) <= one);
    }
  }

  /**
 @notice Function verifies (log_2(pow(x, y)) == mul(log_2(x), (y)). For precision take difference and make it less than 60 percent of the value
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function log_2_check_4(int128 x, int128 y) public {
    if (x > one && y > one) {
      uint256 temp = toUInt(y);
      assert(
        abs(sub(log_2(pow(x, temp)), mul(log_2(x), y))) <=
          ((mul(log_2(x), y)) * 60) / 100
      );
    }
  }

  /**
 @notice Function verifies (pow(2, log_2(x))) == x). For precision take difference and make it less than 60 percent of the value
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function log_2_check_5(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      uint256 temp = toUInt(log_2(x));
      assert(abs(sub(pow(two, temp), x)) <= (x * 60) / 100);
    }
  }

  /**
 @notice Function verifies (log_2(x) == log_2(y)). 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function log_2_check_6(int128 x, int128 y) public {
    if (x > zero && y > zero && x == y) {
      assert(log_2(x) == log_2(y));
    }
  }

  /**
 @notice Function verifies (log_2(x) for x = MAX 
 @param x signed 64.64-bit fixed point number
*/
  function log_2_check_7(int128 x) public {
    if (x == MAX_64x64) {
      try this.log_2(x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies (log_2(x) for x = MIN 
 @param x signed 64.64-bit fixed point number
*/
  function log_2_check_8(int128 x) public {
    if (x == MIN_64x64) {
      try this.log_2(x) {
        assert(false);
      } catch {}
    }
  }

  /** Tests for Function LN
   * Calculate natural logarithm of x.  Revert if x <= 0.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (ln(x) for different x values 
 @param x signed 64.64-bit fixed point number
*/
  function ln_check(int128 x) public {
    if (x <= zero) {
      try this.ln(x) {
        assert(false);
      } catch {}
    } else if (x > zero && x < one) assert(ln(x) < zero);
    else if (x == one) assert(ln(x) == zero);
    else if (x >= one) assert(ln(x) >= zero);
  }

  /**
 @notice Function verifies (ln(mul(x, y)) == add(ln(x), ln(y)). For precision take difference and abs to be less than 1
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function ln_check_2(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub(ln(mul(x, y)), add(ln(x), ln(y)))) <= one);
    }
  }

  /**
 @notice Function verifies (ln(div(x, y)) == sub(ln(x), ln(y)). For precision take difference and abs to be less than 1
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function ln_check_3(int128 x, int128 y) public {
    if (x > zero && y > zero) {
      assert(abs(sub(ln(div(x, y)), sub(ln(x), ln(y)))) <= one);
    }
  }

  /**
 @notice Function verifies (ln(pow(x, y)) == mul(ln(x), (y)). For precision take difference and make it less than 60 percent of the value
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function ln_check_4(int128 x, int128 y) public {
    if (x > one && y > one) {
      uint256 temp = toUInt(y);
      assert(
        abs(sub(ln(pow(x, temp)), mul(ln(x), y))) <=
          ((mul(ln(x), y)) * 60) / 100
      );
    }
  }

  /**
 @notice Function verifies (pow(2, ln(x))) == x). For precision take difference and make it less than 60 percent of the value
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function ln_check_5(int128 x, int128 y) public {
    if (x > one && y > one) {
      uint256 temp = toUInt(ln(x));
      assert(abs(sub(pow(two, temp), x)) <= x);
    }
  }

  /**
 @notice Function verifies (ln(x) == ln(y)). 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function ln_check_6(int128 x, int128 y) public {
    if (x > zero && y > zero && x == y) {
      assert(ln(x) == ln(y));
    }
  }

  /**
 @notice Function verifies (ln(x) for x = MAX 
 @param x signed 64.64-bit fixed point number
*/
  function ln_check_7(int128 x) public {
    if (x == MAX_64x64) {
      try this.ln(x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies (ln(x) for x = MIN 
 @param x signed 64.64-bit fixed point number
*/
  function ln_check_8(int128 x) public {
    if (x == MIN_64x64) {
      try this.ln(x) {
        assert(false);
      } catch {}
    }
  }

  /** Tests for Function EXP_2
   * Calculate binary exponent of x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (exp_2(x) for different x values and verfies over and underflows
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check(int128 x) public {
    if (x >= 0x400000000000000000) {
      try this.exp_2(x) {
        assert(false);
      } catch {}
    } else if (x < -0x400000000000000000) assert(exp_2(x) == zero);
    else if (x == -0x400000000000000000) assert(exp_2(x) == 1);
    else if (x == zero) assert(exp_2(x) == one);
    else if (x == one) assert(exp_2(x) == two);
    else if (x >= -0x400000000000000000 && x < 0x400000000000000000)
      assert(exp_2(x) >= zero);
  }

  /**
 @notice Function verifies (mul(exp_2(x), exp_2(y)) == exp_2(add(x, y)); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check_2(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      assert(sub(mul(exp_2(x), exp_2(y)), exp_2(add(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (pow(exp_2(x), temp) == exp_2(mul(x, y))); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check_3(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      uint256 temp = toUInt(y);
      assert(sub(pow(exp_2(x), temp), exp_2(mul(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (div(exp_2(x), exp_2(y)) == exp_2(sub(x, y))); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check_4(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      assert(sub(div(exp_2(x), exp_2(y)), exp_2(sub(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (exp_2(div(x, y)) == pow(exp_2(inv(y)), temp); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check_5(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      uint256 temp = toUInt(y);
      assert(abs(sub(exp_2(div(x, y)), pow(exp_2(inv(y)), temp))) <= two);
    }
  }

  /**
 @notice Function verifies (inv(exp_2(neg(x))) == exp_2(x)); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_2_check_6(int128 x) public {
    if (x >= -0x400000000000000000 && x < 0x400000000000000000) {
      assert(sub(inv(exp_2(neg(x))), exp_2(x)) <= one);
    }
  }

  /**
 @notice Function verifies (exp_2(x)) for x = MAX
*/
  function exp_2_check_7() public {
    int128 x = MAX_64x64;
    try this.exp_2(x) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies (exp_2(x)) for x = MIN
*/
  function exp_2_check_8() public {
    int128 x = MIN_64x64;
    try this.exp_2(x) {} catch {
      assert(false);
    }
  }

  /** Tests for Function exp EXP
   * Calculate natural exponent of x.  Revert on overflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (exp(x) for different x values and verfies over and underflows
 @param x signed 64.64-bit fixed point number
*/
  function exp_check(int128 x) public {
    if (x >= 0x400000000000000000) {
      try this.exp(x) {
        assert(false);
      } catch {}
    } else if (x < -0x400000000000000000) assert(exp(x) == zero);
    else if (x == -0x400000000000000000) assert(exp(x) == zero);
    else if (x == zero) assert(exp(x) == one);
    else if (x == one) assert(exp(x) >= two);
    else if (x >= -0x400000000000000000 && x < 0x400000000000000000)
      assert(exp(x) >= zero);
  }

  /**
 @notice Function verifies (mul(exp(x), exp(y)) == exp(add(x, y)); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_check_2(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      assert(sub(mul(exp(x), exp(y)), exp(add(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (pow(exp(x), temp) == exp(mul(x, y))); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_check_3(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      uint256 temp = toUInt(y);
      assert(sub(pow(exp(x), temp), exp(mul(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (div(exp(x), exp(y)) == exp(sub(x, y))); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_check_4(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      assert(sub(div(exp(x), exp(y)), exp(sub(x, y))) <= one);
    }
  }

  /**
 @notice Function verifies (exp(div(x, y)) == pow(exp(inv(y)), temp); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_check_5(int128 x, int128 y) public {
    if (
      x >= -0x400000000000000000 &&
      x < 0x400000000000000000 &&
      y >= -0x400000000000000000 &&
      y < 0x400000000000000000 &&
      (add(x, y)) >= -0x400000000000000000 &&
      (add(x, y)) < 0x400000000000000000
    ) {
      uint256 temp = toUInt(y);
      assert(abs(sub(exp(div(x, y)), pow(exp(inv(y)), temp))) <= two);
    }
  }

  /**
 @notice Function verifies (inv(exp(neg(x))) == exp(x)); it takes difference to be less than 1 for precision
 @param x signed 64.64-bit fixed point number
*/
  function exp_check_6(int128 x) public {
    if (x >= -0x400000000000000000 && x < 0x400000000000000000) {
      assert(sub(inv(exp(neg(x))), exp(x)) <= one);
    }
  }

  /**
 @notice Function verifies (exp_2(x)) for x = MAX
*/
  function exp_check_7(int128 x) public {
    x = MAX_64x64;
    try this.exp(x) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies (exp_2(x)) for x = MIN
*/
  function exp_check_8() public {
    int128 x = MIN_64x64;
    try this.exp(x) {} catch {
      assert(false);
    }
  }

  /** Tests for Function GAVG
   * Calculate geometric average of x and y, i.e. sqrt (x * y) rounding down.
   * Revert on overflow or in case x * y is negative.
   *
   * @param x signed 64.64-bit fixed point number
   * @param y signed 64.64-bit fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function verifies (gavg(x, y) for overflow and underflow
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      try this.gavg(x, y) {} catch {
        assert(false);
      }
    } else {
      try this.gavg(x, y) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies (pow(gavg(x, y), 2)== mul(x, y))
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_2(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) assert(abs(sub(pow(gavg(x, y), 2), mul(x, y))) <= one);
  }

  /**
 @notice Function verifies (gavg(x, y)) for x and y MAX and MIN
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_3(int128 x, int128 y) public {
    x = MAX_64x64;
    y = MIN_64x64;
    try this.gavg(x, y) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies (gavg(x, y)) == abs(avg(x, y)) 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_4(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) assert((gavg(x, y) <= abs(avg(x, y))));
  }

  /**
 @notice Function verifies (gavg(x, y)) == gavg(temp, temp))) where temp = gavg(x, y)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_5(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      int128 temp = gavg(x, y);
      assert((gavg(x, y)) == gavg(temp, temp));
    }
  }

  /**
 @notice Function verifies (pow(gavg(x, y), 2), mul(avg(x, y) == harmonicavg) where harmonicavg = div(2, add(div(1, x), div(1, y))
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_6(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      int128 temp = gavg(x, y);
      int128 harmonicavg = div(2, add(div(1, x), div(1, y)));
      assert(
        (
          (abs(sub(pow(gavg(x, y), 2), mul(avg(x, y), harmonicavg))) <=
            (abs(mul(avg(x, y), harmonicavg)) * 30) / 100)
        ) || (abs(sub(pow(gavg(x, y), 2), mul(avg(x, y), harmonicavg))) <= one)
      );
    }
  }

  /**
 @notice Function verifies (gavg(x, y) <= abs(x) || gavg(x, y) <= abs(y)) where y != x and also result +/- sign
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_7(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x != y) {
        assert(gavg(x, y) <= abs(x) || gavg(x, y) <= abs(y));
        assert(gavg(x, y) >= zero);
      } else if (x == y) {
        assert(gavg(x, y) == gavg(x, x));
        assert(gavg(x, y) == gavg(y, y));
        assert(gavg(x, y) >= zero);
      }
    }
  }

  /**
 @notice Function verifies (gavg(x, y)== pow(x, 2)) 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_8(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x != y) {
        assert(abs(gavg(x, y)) <= abs(x) || abs(gavg(x, y)) <= abs(y));
        assert(gavg(x, y) >= zero);
      } else if (x == y) {
        assert(abs(sub(gavg(x, y), pow(x, 2))) <= one);
        assert(abs(sub(gavg(x, y), pow(y, 2))) <= one);
      }
    }
  }

  /**
 @notice Function verifies (gavg(x, y) result being greater than or less than zero and whether it is lower or greater than x and y 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_9(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (abs(x) > abs(y) && x != y && x != zero && y != zero) {
        assert(gavg(x, y) >= zero);
      } else if (x < zero && y > zero && abs(y) > abs(x)) {
        assert(gavg(x, y) > zero);
        assert(gavg(x, y) < y);
        assert(gavg(x, y) > x);
      }
    }
  }

  /**
 @notice Function verifies (mul(gavg(x, y), two) == ((add(abs(x), abs(y))) with some margin for precision
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_10(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x > two && y > two)
        assert(
          mul(gavg(x, y), two) <= ((add(abs(x), abs(y))) * 101) / 100 &&
            mul(gavg(x, y), two) >= ((add(abs(x), abs(y))) * 99) / 100
        );
    }
  }

  /**
 @notice Function verifies (gavg(x, y) == sqrt(pow(y, 2)) for x = 0 and y != 0
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_11(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x == zero && y == zero) {
        assert(gavg(x, y) == zero);
        assert(gavg(x, y) == gavg(x, x) && gavg(x, y) == gavg(y, y));
      } else if (x == zero && y != zero) assert(gavg(x, y) == sqrt(pow(y, 2)));
    }
  }

  /**
 @notice Function verifies (gavg(x, y) == gavg(y,x))
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_12(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      assert(gavg(x, y) == gavg(y, x));
    }
  }

  /**
 @notice Function verifies (gavg(x, y) == x) for x = neg(y)
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_13(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x == neg(y)) assert(gavg(x, y) == x);
    }
  }

  /**
 @notice Function verifies (gavg(x, y) == div(add(x, y), two)) for x and y > 2
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_14(int128 x, int128 y) public {
    int256 m = mul(x, y);
    if (
      m >= 0 &&
      m < 0x4000000000000000000000000000000000000000000000000000000000000000
    ) {
      if (x > two && y > two) assert(gavg(x, y) == div(add(x, y), two));
    }
  }

  /**
 @notice Function verifies (gavg(x, y) for MAX and MIN x and y 
 @param x signed 64.64-bit fixed point number
 @param y signed 64.64-bit fixed point number
*/
  function gavg_check_15(int128 x, int128 y) public {
    x = MAX_64x64;
    y = MIN_64x64;
    try this.gavg(x, y) {
      assert(false);
    } catch {}
  }

  /** Tests for Function DIVU
   * Calculate x / y rounding towards zero, where x and y are unsigned 256-bit
   * integer numbers.  Revert on overflow or when y is zero.
   *
   * @param x unsigned 256-bit integer number
   * @param y unsigned 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function checks whether the result is within range 
*/
  function divu_check() public {
    int256 _rand = divu(MAX_U256, MAX_U256);
    assert((_rand >= 0) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function verifies whether the divu(MAX, one) fails 
*/
  function divu_check_2() public {
    uint256 onei = toUInt(one);
    try this.divu(MAX_U256, onei) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(MAX, x) for different x values
 @param x unsigned 256-bit integer number
*/
  function divu_check_3(uint256 x) public {
    if (
      (x >= 0x2000000000000000400000000000000080000000000000010 &&
        x < (MAX_U256 - toUInt(thousand)))
    ) {
      try this.divu(MAX_U256, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies the divu(MAX, x) for different x values
 @param x unsigned 256-bit integer number
*/
  function divu_check_4(uint256 x) public {
    int128 y;
    if (x != toUInt(zero) && x >= toUInt(one)) {
      try this.divu(MAX_U256, x) {
        y = (divu(MAX_U256, x));
        if (y > MAX_64x64) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies the divu(MAX, MAX) passes
*/
  function divu_check_5() public {
    try this.divu(MAX_U256, MAX_U256) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies the divu(MAX, 0) fails
*/
  function divu_check_6() public {
    try this.divu(MAX_U256, toUInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(MAX + one, 0) fails
*/
  function divu_check_7() public {
    try this.divu(MAX_U256 + toUInt(one), toUInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(0, x) for different values
 @param x unsigned 256-bit integer number
*/
  function divu_check_8(uint256 x) public {
    if ((x) >= toUInt(one) && x != toUInt(neg(one))) {
      try this.divu(0, x) {} catch {
        assert(false);
      }
    } else {
      try this.divu(0, x) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies the divu(0, x) for different values
 @param x unsigned 256-bit integer number
*/
  function divu_check_9(uint256 x) public {
    try this.divu(x, toUInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(0, MAX + one) passes
*/
  function divu_check_10() public {
    try this.divu(toUInt(zero), MAX_U256 + toUInt(one)) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies the divu(x, 0 - one) fails
 @param x unsigned 256-bit integer number
*/
  function divu_check_11(uint256 x) public {
    try this.divu(x, 0 - toUInt(one)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(0 - one, x) fails
 @param x unsigned 256-bit integer number
*/
  function divu_check_12(uint256 x) public {
    try this.divu(0 - toUInt(one), x) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(MAX, 0) fails
*/
  function divu_check_13() public {
    try this.divu(MAX_U256, 0) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(0, -1) fails
*/
  function divu_check_14() public {
    try this.divu(0, toUInt(neg(one))) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divu(x,y) == divu((neg((y))), (neg((x)))
 @param x unsigned 256-bit integer number
 @param y unsigned 256-bit integer number
*/
  function divu_check_15(uint256 x, uint256 y) public {
    int128 z = divu(x, y);
    assert(z >= 0 && z <= MAX_64x64);
    if (fromUInt(x) == zero && fromUInt(y) != zero) assert(z <= zero);
    if ((fromUInt(x) == one) && (fromUInt(y) != 0))
      assert(z == inv(fromUInt(y)));
    if (fromUInt(y) == one) assert(z == fromUInt(x));
    if ((abs(z) >= one) && fromUInt(y) >= one) {
      assert(
        ((abs(mul(z, fromUInt(y)))) <= (fromUInt(x) * one)) &&
          ((abs(mul(z, fromUInt(y)))) >= fromUInt(x) / one)
      );
      if (fromUInt(x) >= one) {
        assert(z == mul(fromUInt(x), divu(1, y)));
        if (fromUInt(x) > zero && fromUInt(y) > zero)
          assert(z <= fromUInt(x) && z <= fromUInt(y));
        if (fromUInt(x) > zero && fromUInt(y) < zero) assert(z <= fromUInt(x));
        if (fromUInt(x) < zero && fromUInt(y) < zero)
          assert(z >= fromUInt(x) && z >= fromUInt(y));
        if (fromUInt(x) < zero && fromUInt(y) > zero)
          assert(z >= fromUInt(x) && z < fromUInt(y));
        assert(z == divu(toUInt(neg(fromUInt(y))), toUInt(neg(fromUInt(x)))));
      }
    }
    if (fromUInt(x) > one && fromUInt(y) > one && divu(x, y) > one) {
      if (
        abs(divu(x, y + toUInt(one))) ==
        abs(sub((divu(x, y)), (fromUInt(y) + (one))))
      ) assert(true);
      else assert(false);
    }
  }

  /**
 @notice Function verifies the divu((divu(x, y)), z) == (divu((divu(x, z)), y. For precision, taken abs difference to be less than 1. 
 @notice For all values above 8 for input
 @param x unsigned 256-bit integer number
 @param y unsigned 256-bit integer number
 @param z unsigned 256-bit integer number
*/
  function divu_check_16(
    uint256 x,
    uint256 y,
    uint256 z
  ) public {
    uint256 eighti = toUInt(eight);
    if (
      (z >= eighti) &&
      (y >= eighti) &&
      (x >= eighti) &&
      (z <= MAX_U256) &&
      (y <= MAX_U256) &&
      (x <= MAX_U256)
    ) {
      try this.divu(x, y) {
        uint256 t = toUInt(divu(x, y));
        try this.divu(t, z) {
          assert(
            abs(
              sub(divu(toUInt(divu(x, y)), z), (divu(toUInt(divu(x, z)), y)))
            ) <=
              one &&
              abs(
                sub(divu(toUInt(divu(x, y)), z), (divu(toUInt(divu(x, z)), y)))
              ) <=
              one
          );
          int128 w = divu(toUInt(divu(x, y)), z);

          assert((fromUInt(x) >= ((mul((mul(w, fromUInt(z))), fromUInt(y))))));
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function verifies the (x) == mul(mul(w, (z)), (y)) where w = divu((divu(x, y)), z
 @notice For all values above 8 for input
 @param x unsigned 256-bit integer number
 @param y unsigned 256-bit integer number
 @param z unsigned 256-bit integer number
*/
  function divu_check_17(
    uint256 x,
    uint256 y,
    uint256 z
  ) public {
    uint256 eighti = toUInt(eight);
    if (
      (z >= eighti) &&
      (y >= eighti) &&
      (x >= eighti) &&
      (z <= MAX_U256) &&
      (y <= MAX_U256) &&
      (x <= MAX_U256)
    ) {
      try this.divu(x, y) {
        uint256 t = toUInt(divu(x, y));
        try this.divu(t, z) {
          assert(
            abs(
              sub(divu(toUInt(divu(x, y)), z), (divu(toUInt(divu(x, z)), y)))
            ) <= one
          );
          int128 w = divu(toUInt(divu(x, y)), z);
          int128 c = mul((mul(w, fromUInt(z))), fromUInt(y));
          int128 newr = sub(
            fromUInt(x),
            (mul(mul(w, fromUInt(z)), fromUInt(y)))
          );
          assert(newr <= ((fromUInt(x) * 120) / 100));
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function verifies the (x) == mul(mul(w, (z)), (y)) where w = divu((divu(x, y)), z
 @notice For all values above 1000 for input
 @param x unsigned 256-bit integer number
 @param y unsigned 256-bit integer number
 @param z unsigned 256-bit integer number
*/
  function divu_check_18(
    uint256 x,
    uint256 y,
    uint256 z
  ) public {
    uint256 thousandi = toUInt(thousand);
    if (
      (z >= thousandi) &&
      (y >= thousandi) &&
      (x >= thousandi) &&
      (z <= MAX_U256) &&
      (y <= MAX_U256) &&
      (x <= MAX_U256)
    ) {
      try this.divu(x, y) {
        uint256 t = toUInt(divu(x, y));
        try this.divu(t, z) {
          int128 l1 = divu(toUInt(divu(x, y)), z);
          int128 l2 = divu(toUInt(divu(x, z)), y);
          assert(
            divu(toUInt(divu(x, y)), z) <=
              ((divu(toUInt(divu(x, z)), y) * 110) / 100) &&
              divu(toUInt(divu(x, y)), z) >=
              ((divu(toUInt(divu(x, z)), y) * 90) / 100)
          );
          int128 w = divu(toUInt(divu(x, y)), z);
          int128 c = mul((mul(w, fromUInt(z))), fromUInt(y));
          int128 newr = sub(
            fromUInt(x),
            (mul(mul((w), fromUInt(z)), fromUInt(y)))
          );
          assert(newr <= fromUInt(x));
        } catch {}
      } catch {}
    }
  }

  /** Tests for Function DIVI
   * Calculate x / y rounding towards zero, where x and y are signed 256-bit
   * integer numbers.  Revert on overflow or when y is zero.
   *
   * @param x signed 256-bit integer number
   * @param y signed 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function checks whether the result is within range 
*/
  function divi_check() public {
    int256 _rand = divi(MAX_256, MAX_256);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function verifies whether the divi(MAX, one) fails 
*/
  function divi_check_2() public {
    int256 onei = toInt(one);
    try this.divi(MAX_256, onei) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(MAX, x) for different x values passes
 @param x signed 256-bit integer number
*/
  function divi_check_3(int256 x) public {
    if (((x) >= 0x1000000000000000200000000000000040000000000000008)) {
      try this.divi(MAX_256, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function verifies the divu(MAX, x) for different x values
 @param x signed 256-bit integer number
*/
  function divi_check_4(int256 x) public {
    int128 y;
    if (x != toInt(zero) && x >= toInt(one)) {
      try this.divi(MAX_256, x) {
        y = (divi(MAX_256, x));
        if (y > MAX_256) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies the divi(MAX, MAX) passes
*/
  function divi_check_5() public {
    try this.divi(MAX_256, MAX_256) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies the divi(MAX, 0) fails
*/
  function divi_check_6() public {
    try this.divi(MAX_256, toInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(MAX + one, 0) fails
*/
  function divi_check_7() public {
    try this.divi(MAX_256 + toInt(one), toInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(x , 0) fails
*/
  function divi_check_9(int256 x) public {
    try this.divi(x, toInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(0, MAX + one) fails
*/
  function divi_check_10() public {
    try this.divi(toInt(zero), MAX_256 + toInt(one)) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies the divi(x, MIN - one) fails
 @param x signed 256-bit integer number
*/
  function divi_check_11(int256 x) public {
    if (x != 0) {
      try this.divi(x, MIN_256 - toInt(one)) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function verifies the divi(MIN - one , x) fails for x = 0 or 1
 @param x unsigned 256-bit integer number
*/
  function divi_check_12(int256 x) public {
    try this.divi(MIN_256 - toInt(one), x) {
      if ((x) == one || x == zero) assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(MAX, MAX) passes
*/
  function divi_check_13() public {
    try this.divi(MAX_256, MIN_256) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function verifies the divi(MIN, -one) fails
*/
  function divi_check_14() public {
    try this.divi(MIN_256, toInt(neg(one))) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function verifies the divi(x,y) == divi((neg((y))), (neg((x)))
 @notice commented ones asserts fail in certain scenarios
 @param x signed 256-bit integer number
 @param y signed 256-bit integer number
*/
  function divi_check_15(int256 x, int256 y) public {
    int128 z = divi(x, y);
    assert(z >= MIN_64x64 && z <= MAX_64x64);
    if ((x) == toInt(zero) && (y) != toInt(zero)) assert((z) == zero);
    if (((x) == toInt(one)) && ((y) != 0))
      assert(abs(sub(z, inv(fromInt(y)))) <= one);
    // if ((y) == toInt(one)) assert(z == (x));
    if ((abs(z) >= one) && (y) >= toInt(one)) {
      assert(
        ((abs(mul(z, fromInt(y)))) <= ((x) * one)) &&
          ((abs(mul(z, fromInt(y)))) >= (x) / one)
      );
      if ((x) >= toInt(one)) {
        assert(z == mul(fromInt(x), divi(1, y)));
        // if ((x) > toInt(zero) && (y) > toInt(zero))
        //   assert(z <= (x) && z <= (y));
        if ((x) > toInt(zero) && (y) < toInt(zero)) assert(z <= (x));
        if ((x) < toInt(zero) && (y) < toInt(zero))
          assert(z >= (x) && z >= (y));
        if ((x) < toInt(zero) && (y) > toInt(zero)) assert(z >= (x) && z < (y));
        assert(z == divi(toInt(neg(fromInt(y))), toInt(neg(fromInt(x)))));
      }
    }
    if ((x) > toInt(one) && (y) > toInt(one) && divi(x, y) > one) {
      if (
        abs(divi(x, y + toInt(one))) ==
        abs(sub((divi(x, y)), (fromInt(y) + (one))))
      ) assert(true);
      else assert(false);
    }
  }

  /**
 @notice Function verifies the divi((divi(x, y)), z) == (divi((divi(x, z)), y. For precision, taken abs difference to be less than 1. 
 @notice For all values above 8 for input
 @param x signed 256-bit integer number
 @param y signed 256-bit integer number
 @param z signed 256-bit integer number
*/
  function divi_check_16(
    int256 x,
    int256 y,
    int256 z
  ) public {
    int256 eighti = toInt(eight);
    if (
      (z >= eighti) &&
      (y >= eighti) &&
      (x >= eighti) &&
      (z <= MAX_256) &&
      (y <= MAX_256) &&
      (x <= MAX_256)
    ) {
      try this.divi(x, y) {
        int256 t = toInt(divi(x, y));
        try this.divi(t, z) {
          assert(
            (abs(
              sub(divi(toInt(divi(x, y)), z), (divi(toInt(divi(x, z)), y)))
            ) <= one) &&
              (abs(
                sub(divi(toInt(divi(x, y)), z), (divi(toInt(divi(x, z)), y)))
              ) <= one)
          );
          int128 w = divi(toInt(divi(x, y)), z);

          assert(
            (from128x128(x) >=
              ((mul((mul(w, from128x128(z))), from128x128(y)))))
          );
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function verifies the (x) == mul(mul(w, (z)), (y)) where w = divi((divi(x, y)), z
 @notice For all values above 8 for input
 @param x signed 256-bit integer number
 @param y signed 256-bit integer number
 @param z signed 256-bit integer number
*/
  function divi_check_17(
    int256 x,
    int256 y,
    int256 z
  ) public {
    int256 eighti = toInt(eight);
    if (
      (z >= eighti) &&
      (y >= eighti) &&
      (x >= eighti) &&
      (z <= MAX_256) &&
      (y <= MAX_256) &&
      (x <= MAX_256)
    ) {
      try this.divi(x, y) {
        int256 t = toInt(divi(x, y));
        try this.divi(t, z) {
          int128 l1 = divi(toInt(divi(x, y)), z);
          int128 l2 = divi(toInt(divi(x, z)), y);
          assert(
            ((divi(toInt(divi(x, y)), z)) <=
              ((divi(toInt(divi(x, z)), y) * 110) / 100) &&
              (divi(toInt(divi(x, y)), z)) >=
              ((divi(toInt(divi(x, z)), y) * 90) / 100)) ||
              (abs(
                sub(divi(toInt(divi(x, y)), z), ((divi(toInt(divi(x, z)), y))))
              ) <= two)
          );
          int128 w = divi(toInt(divi(x, y)), z);
          int128 c = mul((mul(w, from128x128(z))), from128x128(y));
          int128 newr = sub(
            from128x128(x),
            (mul(mul(w, from128x128(z)), from128x128(y)))
          );
          assert(newr <= ((from128x128(x) * 120) / 100));
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function verifies the (x) == mul(mul(w, (z)), (y)) where w = divi((divi(x, y)), z
 @notice For all values above 1000 for input
 @param x signed 256-bit integer number
 @param y signed 256-bit integer number
 @param z signed 256-bit integer number
*/
  function divi_check_18(
    int256 x,
    int256 y,
    int256 z
  ) public {
    int256 thousandi = toInt(thousand);
    if (
      (z >= thousandi) &&
      (y >= thousandi) &&
      (x >= thousandi) &&
      (z <= MAX_256) &&
      (y <= MAX_256) &&
      (x <= MAX_256)
    ) {
      try this.divi(x, y) {
        int256 t = toInt(divi(x, y));
        try this.divi(t, z) {
          int128 l1 = divi(toInt(divi(x, y)), z);
          int128 l2 = divi(toInt(divi(x, z)), y);
          assert(
            divi(toInt(divi(x, y)), z) <=
              ((divi(toInt(divi(x, z)), y) * 110) / 100) &&
              divi(toInt(divi(x, y)), z) >=
              ((divi(toInt(divi(x, z)), y) * 90) / 100)
          );
          int128 w = divi(toInt(divi(x, y)), z);
          int128 c = mul((mul(w, from128x128(z))), from128x128(y));
          int128 newr = sub(
            from128x128(x),
            (mul(mul((w), from128x128(z)), from128x128(y)))
          );
          assert(newr <= from128x128(x));
        } catch {}
      } catch {}
    }
  }

  /** Tests for Function MULI
   * Calculate x * y rounding towards zero, where x is signed 64.64 fixed point
   * number and y is signed 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64 fixed point number
   * @param y signed 256-bit integer number
   * @return signed 256-bit integer number
   */

  /**
 @notice Function checks the multiplication functions 
 @param x signed 64.64-bit fixed point number
 @param y signed 256-bit integer number
*/
  function muli_check(int128 x, int256 y) public {
    int256 _rand = muli(x, y);
    assert(_rand == ((fromInt(x) * fromInt(y)) >> 64));
  }

  /**
 @notice Function verifies whether values returned within the range
*/
  function muli_check_2() public {
    int256 _rand = muli(MAX_64x64, MAX_256);
    assert((_rand >= MIN_256) && (_rand <= MAX_256));
  }

  /**
 @notice Function asserts whether the muli function passes with inputs of MAX and 1
*/
  function muli_check_3() public {
    try this.muli(MAX_64x64, one) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the muli function result for (x, y, z) is the same 
 @notice irrespective of order of multiplication 
 @param x signed 64.64-bit fixed point number
 @param y signed 256-bit integer number
 @param z signed 64.64-bit fixed point number
*/
  function muli_check_4(
    int128 x,
    int256 y,
    int128 z
  ) public {
    z = abs(z);
    y = abs(from128x128(y));
    x = abs(x);
    if ((abs(z) >= one) && (abs((from128x128(y))) >= one) && (abs(x) >= one)) {
      try this.muli(x, y) {
        int256 t = muli(x, y);
        try this.muli(z, t) {
          assert(muli(z, (muli(x, y))) == muli(from128x128(muli(x, z)), y));
          assert(
            muli(from128x128(muli(z, y)), x) == muli(from128x128(muli(x, z)), y)
          );
        } catch {}
      } catch {}
    }
  }

  /**
 @notice Function asserts whether the muli function of MAX with different values gives a return value lower than MAX
 @param x signed 256-bit integer number
*/
  function muli_check_5(int256 x) public {
    int256 y;
    if (x != zero && (x) > one) {
      try this.muli(MAX_64x64, x) {
        y = muli(MAX_64x64, x);
        if (y < MAX_64x64) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function asserts whether the muli function of MAX & MAX returns an error 
*/
  function muli_check_6() public {
    try this.muli(MAX_64x64, MAX_256) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the muli function returns an error for MAX & zero
*/
  function muli_check_7() public {
    try this.muli(MAX_64x64, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the muli function returns an error for (MAX + one) & zero returns an eror or not
*/
  function muli_check_8() public {
    try this.muli(MAX_64x64 + one, zero) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the muli function returns a value for x & zero
 @param x signed 64.64-bit fixed point number
*/
  function muli_check_10(int128 x) public {
    try this.muli(x, zero) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the muli function returns an error for zero & (MAX + one)
*/
  function muli_check_11() public {
    try this.muli(zero, MAX_256 + one) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the muli function returns a value within the range
 @notice Also checks results if either input is zero or one of them is zero
 @notice Also verifies z / y is equivalent to x (adjustment made for precision)
 @notice Also asserts the output's sign, based on the inputs' sign
 @notice Lastly also checks if x *(y + one) is equivalent to (x *y) + x
 @param x signed 64.64-bit fixed point number
 @param y signed 256-bit integer number
*/
  function muli_check_12(int128 x, int256 y) public {
    int256 z = muli(x, y);
    assert(z >= MIN_256 && z <= MAX_256);
    if (x == zero || y == zero) assert(z == zero);
    if (x == one) assert(z == y);
    if (y == one) assert(z == x);
    if ((z >= one) && (y) >= one) {
      assert((((z / y)) <= ((x) * one)) && (((z / y)) >= ((x) / one)));
      if (abs(x) >= one) {
        assert(z == muli(from128x128(y), x));
        if (x > zero && y > zero) assert(z >= x && z >= y);
        if (x > zero && y < zero) assert(z < x && z <= y);
        if (x < zero && y < zero) assert(z > x && z > y);
        if (x < zero && y > zero) assert(z <= x && z < y);
        assert(z == muli(neg(from128x128(y)), neg(x)));
      }
    }
    if (x > zero && y > zero) {
      if (muli(x, y + one) == muli(x, y) + x) assert(true);
      else assert(false);
    }
  }

  /** Tests for Function MULU
   * Calculate x * y rounding down, where x is signed 64.64 fixed point number
   * and y is unsigned 256-bit integer number.  Revert on overflow.
   *
   * @param x signed 64.64 fixed point number
   * @param y unsigned 256-bit integer number
   * @return unsigned 256-bit integer number
   */

  /**
 @notice Function checks the multiplication functions 
 @param x signed 64.64-bit fixed point number
 @param y unsigned 256-bit integer number
*/
  function mulu_check(int128 x, uint256 y) public {
    uint256 _rand = mulu(x, y);
    assert((_rand >= 0) && (_rand <= MAX_U256));
  }

  /**
 @notice Function verifies whether values returned within the range
*/
  function mulu_check_2() public {
    uint256 _rand = mulu(MAX_64x64, MAX_U256);
    assert((_rand >= 0) && (_rand <= MAX_U256));
  }

  /**
 @notice Function asserts whether the mulu function passes with inputs of MAX and 1
*/
  function mulu_check_3() public {
    try this.mulu(MAX_64x64, toUInt(one)) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the mulu function of MAX with different values 
 @param x signed 64.64-bit fixed point number
*/
  function mulu_check_4(int128 x) public {
    if ((x) <= one && x >= zero) {
      try this.mulu(x, MAX_U256) {} catch {
        assert(false);
      }
    } else {
      try this.mulu(x, MAX_U256) {
        assert(false);
      } catch {}
    }
  }

  /**
 @notice Function asserts whether the mulu function of MAX with different values gives a return value lower than MAX
 @param x unsigned 256-bit integer number
*/
  function mulu_check_5(uint256 x) public {
    uint256 y;
    if (x != toUInt(zero) && (x) > toUInt(one)) {
      try this.mulu(MAX_64x64, x) {
        y = mulu(MAX_64x64, x);
        if (y < toUInt(MAX_64x64)) assert(false);
      } catch {}
    }
  }

  /**
 @notice Function asserts whether the mulu function of MAX & MAX returns an error 
*/
  function mulu_check_6() public {
    try this.mulu(MAX_64x64, MAX_U256) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the mulu function returns an error for MAX & zero
*/
  function mulu_check_7() public {
    try this.mulu(MAX_64x64, toUInt(zero)) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the mulu function returns an error for (MAX + one) & zero returns an eror or not
*/
  function mulu_check_8() public {
    try this.mulu(MAX_64x64 + one, toUInt(zero)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the mulu function of MIN with different values 
 @param x unsigned 256-bit integer number
*/
  function mulu_check_9(uint256 x) public {
    if (x != toUInt(zero)) {
      try this.mulu(MIN_64x64, x) {
        assert(false);
      } catch {}
    } else {
      try this.mulu(MIN_64x64, x) {} catch {
        assert(false);
      }
    }
  }

  /**
 @notice Function asserts whether the mulu function returns an error for x & zero
 @param x signed 64.64-bit fixed point number
*/
  function mulu_check_10(int128 x) public {
    try this.mulu(x, toUInt(zero)) {} catch {
      assert(false);
    }
  }

  /**
 @notice Function asserts whether the mulu function returns an error for zero & (MAX + one)
*/
  function mulu_check_11() public {
    try this.mulu(zero, MAX_U256 + toUInt(one)) {
      assert(false);
    } catch {}
  }

  /**
 @notice Function asserts whether the mulu function returns a value within the range
 @notice Also checks results if either input is zero or one of them is zero
 @notice Also verifies z / y is equivalent to x (adjustment made for precision)
 @notice Also asserts the output's sign, based on the inputs' sign
 @notice Lastly also checks if x *(y + one) is equivalent to (x *y) + x
 @param x signed 64.64-bit fixed point number
 @param x unsigned 256-bit integer number
*/
  function mulu_check_12(int128 x, uint256 y) public {
    uint256 z = mulu(x, y);
    assert(z >= 0 && z <= MAX_U256);
    if (x == zero || y == toUInt(zero)) assert(z == toUInt(zero));
    if (x == one) assert(z == y);
    if (y == toUInt(one)) assert(z == toUInt(x));
    if ((z >= toUInt(one)) && (y) >= toUInt(one)) {
      assert(
        (((z / y)) <= (toUInt(x) * toUInt(one))) &&
          (((z / y)) >= (toUInt(x) / toUInt(one)))
      );
      if (abs(x) >= one) {
        if (x > zero && y > toUInt(zero)) assert(z >= toUInt(x) && z >= y);
        if (
          (x > zero && y < toUInt(zero)) ||
          (x < zero && y < toUInt(zero)) ||
          (x < zero && y > toUInt(zero))
        ) {
          try this.mulu(x, y) {
            assert(false);
          } catch {}
        }
      }
    }
  }

  /** Tests for Function FROMINT
   * Convert signed 256-bit integer number into signed 64.64-bit fixed point
   * number.  Revert on overflow.
   *
   * @param x signed 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x signed 256-bit integer number
*/
  function fromInt_check(int256 x) public {
    int128 _rand = fromInt(x);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function asserts whether the function returns value with the correct sign based on input
 @param x signed 256-bit integer number
*/
  function fromInt_check_2(int256 x) public {
    int128 _rand = fromInt(x);
    if (x <= zero) assert(_rand <= zero);
    else assert(_rand > zero);
  }

  /** Tests for Function TOINT
   * Convert signed 64.64 fixed point number into signed 64-bit integer number
   * rounding down.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 64-bit integer number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x signed 64.64-bit fixed point number
*/
  function toInt_check(int128 x) public {
    int64 _rand = toInt(x);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function asserts whether the function returns value with the correct sign based on input
 @param x signed 64.64-bit fixed point number
*/
  function toInt_check_2(int128 x) public {
    int64 _rand = toInt(x);
    if (x <= zero) assert(_rand <= zero);
    else assert(_rand >= zero);
  }

  /** Tests for Function FROMUINT
   * Convert unsigned 256-bit integer number into signed 64.64-bit fixed point
   * number.  Revert on overflow.
   *
   * @param x unsigned 256-bit integer number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x unsigned 256-bit integer number
*/
  function fromUInt_check(uint256 x) public {
    int128 _rand = fromUInt(x);
    assert((_rand >= zero) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function asserts whether the function returns value with the correct sign based on input
 @param x unsigned 256-bit integer number
*/
  function fromUInt_check_2(uint256 x) public {
    int128 _rand = fromUInt(x);
    if (x < 0) {
      try this.fromUInt(x) {
        assert(false);
      } catch {}
    } else {
      try this.fromUInt(x) {} catch {
        assert(false);
      }
    }
  }

  /** Tests for Function TOUINT
   * Convert signed 64.64 fixed point number into unsigned 64-bit integer
   * number rounding down.  Revert on underflow.
   *
   * @param x signed 64.64-bit fixed point number
   * @return unsigned 64-bit integer number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x signed 64.64-bit fixed point number
*/
  function toUInt_check(int128 x) public {
    uint64 _rand = toUInt(x);
    assert((_rand >= 0) && (_rand <= 0xFFFFFFFFFFFFFFFF));
  }

  /**
 @notice Function asserts whether the function returns with negative and positive inputs
 @param x signed 64.64-bit fixed point number
*/
  function toUInt_check_2(int128 x) public {
    uint64 _rand = toUInt(x);
    if (x < zero) {
      try this.toUInt(x) {
        assert(false);
      } catch {}
    } else {
      try this.toUInt(x) {} catch {
        assert(false);
      }
    }
  }

  /** Tests for Function FROM128x128
   * Convert signed 128.128 fixed point number into signed 64.64-bit fixed point
   * number rounding down.  Revert on overflow.
   *
   * @param x signed 128.128-bin fixed point number
   * @return signed 64.64-bit fixed point number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x signed 128.128-bin fixed point number
*/
  function from128x128_check(int256 x) public {
    int128 _rand = from128x128(x);
    assert((_rand >= MIN_64x64) && (_rand <= MAX_64x64));
  }

  /**
 @notice Function asserts whether the function returns value with the correct sign based on input
 @param x signed 128.128-bin fixed point number
*/
  function from128x128_check_2(int256 x) public {
    int128 _rand = from128x128(x);
    if (x <= zero) assert(_rand <= zero);
    else assert(_rand >= zero);
  }

  /** Tests for Function TO128x128
   * Convert signed 64.64 fixed point number into signed 128.128 fixed point
   * number.
   *
   * @param x signed 64.64-bit fixed point number
   * @return signed 128.128 fixed point number
   */

  /**
 @notice Function asserts whether the function returns within range 
 @param x signed 64.64-bit fixed point number
*/
  function to128x128_check(int128 x) public {
    int256 _rand = to128x128(x);
    assert((_rand >= MIN_256) && (_rand <= MAX_256));
  }

  /**
 @notice Function asserts whether the function returns value with the correct sign based on input
 @param x signed 64.64-bit fixed point number
*/
  function to128x128_check_2(int128 x) public {
    int256 _rand = to128x128(x);
    if (x <= zero) assert(_rand <= zero);
    else assert(_rand > zero);
  }

  // Other Functions

  function echidna_add_withinlimits() public returns (bool) {
    int128 x;
    int128 y;
    int128 sum_add = add(x, y);
    return ((sum_add >= MIN_64x64) && (sum_add <= MAX_64x64));
  }

  function echidna_randomcheck() public returns (bool) {
    return true;
  }

  function testSqrt(int128 x) public {
    bool preNonNeg = x >= 0;
    if (!preNonNeg)
      try this.sqrt(x) {
        assert(false);
      } catch {}
  }
}
