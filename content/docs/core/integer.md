---
title: "Integer"
slug: integer
description: "The methods ruby/spec describes in core/integer, and which Metorex implements."
---

ruby/spec describes 70 methods in `core/integer`, and Metorex implements 69 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Integer#%`**: implemented, parameters `[[:req]]`. Returns `self` modulo `other` as a real numeric (Integer, Float, or Rational).
- **`Integer#&`**: implemented, parameters `[[:req]]`. Bitwise AND; each bit in the result is 1 if both corresponding bits in `self` and `other` are 1, 0 otherwise:
- **`Integer#*`**: implemented, parameters `[[:req]]`. Returns the numeric product of `self` and `other`:
- **`Integer#**`**: implemented, parameters `[[:req]]`. Returns `self` raised to the power `exponent`:
- **`Integer#+`**: implemented, parameters `[[:req]]`. Returns the sum of `self` and `other`:
- **`Integer#-`**: implemented, parameters `[[:req]]`. Returns the difference of `self` and `other`:
- **`Integer#-@`**: implemented, parameters `[]`. Returns `self`, negated:
- **`Integer#/`**: implemented, parameters `[[:req]]`. Returns the quotient of `self` and `other`.
- **`Integer#<`**: implemented, parameters `[[:req]]`. Returns whether the value of `self` is less than the value of `other`; `other` must be numeric, but may not be Complex:
- **`Integer#<<`**: implemented, parameters `[[:req]]`. Returns `self` with bits shifted `count` positions to the left, or to the right if `count` is negative:
- **`Integer#<=`**: implemented, parameters `[[:req]]`. Returns whether the value of `self` is less than or equal to the value of `other`; `other` must be numeric, but may not be Complex:
- **`Integer#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`.
- **`Integer#==`**: implemented, parameters `[[:req]]`. Returns `true` if `self` is numerically equal to `other`; `false` otherwise.
- **`Integer#===`**: implemented, parameters `[[:req]]`. Returns `true` if `self` is numerically equal to `other`; `false` otherwise.
- **`Integer#>`**: implemented, parameters `[[:req]]`. Returns `true` if the value of `self` is greater than that of `other`:
- **`Integer#>=`**: implemented, parameters `[[:req]]`. Returns `true` if the value of `self` is greater than or equal to that of `other`:
- **`Integer#>>`**: implemented, parameters `[[:req]]`. Returns `self` with bits shifted `count` positions to the right, or to the left if `count` is negative:
- **`Integer#[]`**: implemented, parameters `[[:rest]]`. Returns a slice of bits from `self`.
- **`Integer#^`**: implemented, parameters `[[:req]]`. Bitwise EXCLUSIVE OR; each bit in the result is 1 if the corresponding bits in `self` and `other` are different, 0 otherwise:
- **`Integer#abs`**: implemented, parameters `[]`. Returns the absolute value of `self`. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Integer#allbits?`**: implemented, parameters `[[:req]]`. Returns `true` if all bits that are set (=1) in `mask` are also set in `self`; returns `false` otherwise. [An example calling it](/examples/basics-integers-bit-predicates).
- **`Integer#anybits?`**: implemented, parameters `[[:req]]`. Returns `true` if any bit that is set (=1) in `mask` is also set in `self`; returns `false` otherwise. [An example calling it](/examples/basics-integers-bit-predicates).
- **`Integer#bit_count`**: not implemented.
- **`Integer#bit_length`**: implemented, parameters `[[:rest, :args]]`. Returns the number of bits of the value of `self`, which is the bit position of the highest-order bit that is different from the sign bit (where the least significant bit has bit position 1). [An example calling it](/examples/basics-whole-number-limits).
- **`Integer#ceil`**: implemented, parameters `[[:opt, :digits]]`. Returns an integer that is a "ceiling" value for `self`, as specified by the given `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Integer#ceildiv`**: implemented, parameters `[[:rest, :args]]`. Returns the result of division `self` by `numeric`. [An example calling it](/examples/basics-integers-division).
- **`Integer#chr`**: implemented, parameters `[[:rest]]`. Returns a 1-character string containing the character represented by the value of `self`, according to the given `encoding`. [An example calling it](/examples/basics-string-bytes).
- **`Integer#coerce`**: implemented, parameters `[[:req, :other]]`. Returns an array with both a `numeric` and a `int` represented as Integer objects or Float objects. [An example calling it](/examples/basics-floats-methods).
- **`Integer#denominator`**: implemented, parameters `[]`. Returns `1`. [An example calling it](/examples/basics-complexes-protocol).
- **`Integer#digits`**: implemented, parameters `[[:rest]]`. Returns an array of integers representing the `base`-radix digits of `self`; the first element of the array represents the least significant digit: [An example calling it](/examples/basics-integers-division).
- **`Integer#div`**: implemented, parameters `[[:req, :other]]`. Performs integer division; returns the integer result of dividing `self` by `numeric`: [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Integer#divmod`**: implemented, parameters `[[:req]]`. Returns a 2-element array <code>[q, r]</code>, where `q = (self/other).floor    # Quotient`. [An example calling it](/examples/basics-floats-methods).
- **`Integer#downto`**: implemented, parameters `[[:req]]`. Calls the given block with each integer value from `self` down to `limit`; returns `self`: [An example calling it](/examples/builtins-integer-iteration).
- **`Integer#dup`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Integer#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `self` and `other` are the same type and have equal values. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Integer#even?`**: implemented, parameters `[]`. Returns `true` if `self` is an even number, `false` otherwise. [An example calling it](/examples/builtins-big-integers-arithmetic).
- **`Integer#fdiv`**: implemented, parameters `[[:req, :other]]`. Returns the Float result of dividing `self` by `numeric`: [An example calling it](/examples/basics-floats-methods).
- **`Integer#floor`**: implemented, parameters `[[:opt, :digits]]`. Returns an integer that is a "floor" value for `self`, as specified by the given `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Integer#gcd`**: implemented, parameters `[[:req]]`. Returns the greatest common divisor of the two integers. [An example calling it](/examples/basics-integers-coercion).
- **`Integer#gcdlcm`**: implemented, parameters `[[:req]]`. Returns an array with the greatest common divisor and the least common multiple of the two integers, [gcd, lcm].
- **`Integer#inspect`**: implemented, parameters `[[:rest]]`. Returns a string containing the place-value representation of `self` in radix `base` (in 2..36). [An example calling it](/examples/addresses-internet-addresses).
- **`Integer#integer?`**: implemented, parameters `[]`. Since `self` is already an Integer, always returns `true`. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Integer#lcm`**: implemented, parameters `[[:req]]`. Returns the least common multiple of the two integers. [An example calling it](/examples/basics-integers-coercion).
- **`Integer#magnitude`**: implemented, parameters `[]`. Returns the absolute value of `self`. [An example calling it](/examples/basics-floats-methods).
- **`Integer#modulo`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a real numeric (Integer, Float, or Rational). [An example calling it](/examples/programs-calculator-calculator).
- **`Integer#next`**: implemented, parameters `[]`. Returns the successor integer of `self` (equivalent to <code>self + 1</code>): [An example calling it](/examples/builtins-enumerator-stepping).
- **`Integer#nobits?`**: implemented, parameters `[[:req]]`. Returns `true` if no bit that is set (=1) in `mask` is also set in `self`; returns `false` otherwise. [An example calling it](/examples/basics-integers-bit-predicates).
- **`Integer#numerator`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/basics-complexes-protocol).
- **`Integer#odd?`**: implemented, parameters `[]`. Returns `true` if `self` is an odd number, `false` otherwise. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Integer#ord`**: implemented, parameters `[[:rest, :args]]`. Returns `self`; intended for compatibility to character literals in Ruby 1.9. [An example calling it](/examples/c-extensions-c-encodings).
- **`Integer#pow`**: implemented, parameters `[[:req, :exponent], [:rest, :rest]]`. Returns (modular) exponentiation as: [An example calling it](/examples/basics-whole-number-limits).
- **`Integer#pred`**: implemented, parameters `[]`. Returns the predecessor of `self` (equivalent to <code>self - 1</code>):
- **`Integer#rationalize`**: implemented, parameters `[[:rest]]`. Returns the value as a rational. [An example calling it](/examples/builtins-numeric-parts).
- **`Integer#remainder`**: implemented, parameters `[[:req, :other]]`. Returns the remainder after dividing `self` by `other`. [An example calling it](/examples/basics-integers-division).
- **`Integer#round`**: implemented, parameters `[[:opt, :digits]]`. Returns `self` rounded to the nearest value with a precision of `ndigits` decimal digits. [An example calling it](/examples/algorithms-average-temperature).
- **`Integer#size`**: implemented, parameters `[]`. Returns the number of bytes in the machine representation of `self`; the value is system-dependent: [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Integer.sqrt`**: implemented, parameters `[[:req, :args]]`. Returns the integer square root of the non-negative integer `n`, which is the largest non-negative integer less than or equal to the square root of `numeric`. [An example calling it](/examples/basics-integers-division).
- **`Integer#succ`**: implemented, parameters `[]`. Returns the successor integer of `self` (equivalent to <code>self + 1</code>): [An example calling it](/examples/builtins-big-integers-arithmetic).
- **`Integer#times`**: implemented, parameters `[]`. Calls the given block `self` times with each integer in <code>(0..self-1)</code>: [An example calling it](/examples/advanced-threads-that-die-while-waited-on).
- **`Integer#to_f`**: implemented, parameters `[]`. Converts `self` to a Float: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Integer#to_i`**: implemented, parameters `[]`. Returns `self` (which is already an Integer). [An example calling it](/examples/addresses-internet-addresses).
- **`Integer#to_int`**: implemented, parameters `[]`. Returns `self` (which is already an Integer). [An example calling it](/examples/builtins-kernel-argument-checks).
- **`Integer#to_r`**: implemented, parameters `[]`. Returns the value as a rational. [An example calling it](/examples/basics-floats-methods).
- **`Integer#to_s`**: implemented, parameters `[[:rest]]`. Returns a string containing the place-value representation of `self` in radix `base` (in 2..36). [An example calling it](/examples/addresses-internet-addresses).
- **`Integer#truncate`**: implemented, parameters `[[:opt, :digits]]`. Returns `self` truncated (toward zero) to a precision of `ndigits` decimal digits. [An example calling it](/examples/basics-floats-methods).
- **`Integer.try_convert`**: implemented, parameters `[[:req, :args]]`. If `object` is an Integer object, returns `object`.
- **`Integer#upto`**: implemented, parameters `[[:req]]`. Calls the given block with each integer value from `self` up to `limit`; returns `self`: [An example calling it](/examples/builtins-integer-iteration).
- **`Integer#zero?`**: implemented, parameters `[]`. Returns `true` if `self` has a zero value, `false` otherwise. [An example calling it](/examples/advanced-threads-take-turns).
- **`Integer#|`**: implemented, parameters `[[:req]]`. Bitwise OR; each bit in the result is 1 if either corresponding bit in `self` or `other` is 1, 0 otherwise:
- **`Integer#~`**: implemented, parameters `[[:rest, :args]]`. One's complement: returns the value of `self` with each bit inverted.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
