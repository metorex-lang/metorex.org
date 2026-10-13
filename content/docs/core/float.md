---
title: "Float"
slug: float
description: "The methods ruby/spec describes in core/float, and which Metorex implements."
---

ruby/spec describes 49 methods in `core/float`, and Metorex implements 49 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Float#%`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a Float.
- **`Float#*`**: implemented, parameters `[[:req]]`. Returns the numeric product of `self` and `other`:
- **`Float#**`**: implemented, parameters `[[:req]]`. Returns `self` raised to the power `exponent`:
- **`Float#+`**: implemented, parameters `[[:req]]`. Returns the sum of `self` and `other`; the result may be inexact (see Float):
- **`Float#+@`**: implemented, parameters `[]`. Returns `self`.
- **`Float#-`**: implemented, parameters `[[:req]]`. Returns the difference of `self` and `other`:
- **`Float#-@`**: implemented, parameters `[]`. Returns `self`, negated:
- **`Float#/`**: implemented, parameters `[[:req]]`. Returns the quotient of `self` and `other`:
- **`Float#<`**: implemented, parameters `[[:req]]`. Returns whether the value of `self` is less than the value of `other`; `other` must be numeric, but may not be Complex:
- **`Float#<=`**: implemented, parameters `[[:req]]`. Returns whether the value of `self` is less than or equal to the value of `other`; `other` must be numeric, but may not be Complex:
- **`Float#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`.
- **`Float#==`**: implemented, parameters `[[:req]]`. Returns `true` if `other` has the same value as `self`, `false` otherwise:
- **`Float#===`**: implemented, parameters `[[:req]]`. Returns `true` if `other` has the same value as `self`, `false` otherwise:
- **`Float#>`**: implemented, parameters `[[:req]]`. Returns `true` if `self` is numerically greater than `other`:
- **`Float#>=`**: implemented, parameters `[[:req]]`. Returns `true` if `self` is numerically greater than or equal to `other`:
- **`Float#abs`**: implemented, parameters `[]`. Returns the absolute value of `self`: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Float#angle`**: implemented, parameters `[]`. Returns 0 if `self` is positive, Math::PI otherwise. [An example calling it](/examples/basics-floats-methods).
- **`Float#arg`**: implemented, parameters `[]`. Returns 0 if `self` is positive, Math::PI otherwise. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Float#ceil`**: implemented, parameters `[[:opt, :digits]]`. Returns a numeric that is a "ceiling" value for `self`, as specified by the given `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Float#coerce`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array containing `other` converted to a Float and `self`: [An example calling it](/examples/basics-floats-methods).
- **`Float#denominator`**: implemented, parameters `[]`. Returns the denominator (always positive). [An example calling it](/examples/basics-complexes-protocol).
- **`Float#divmod`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array <code>[q, r]</code>, where `q = (self/other).floor      # Quotient`. [An example calling it](/examples/basics-floats-methods).
- **`Float#dup`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Float#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `other` is a Float with the same value as `self`, `false` otherwise: [An example calling it](/examples/array-methods-difference-of-structs).
- **`Float#fdiv`**: implemented, parameters `[[:req, :other]]`. Returns the quotient from dividing `self` by `other`: [An example calling it](/examples/basics-floats-methods).
- **`Float#finite?`**: implemented, parameters `[]`. Returns `true` if `self` is not `Infinity`, <code>-Infinity</code>, or `NaN`, `false` otherwise: [An example calling it](/examples/builtins-kernel-float).
- **`Float#floor`**: implemented, parameters `[[:opt, :digits]]`. Returns a float or integer that is a "floor" value for `self`, as specified by `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Float#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Float#infinite?`**: implemented, parameters `[]`. Returns: [An example calling it](/examples/builtins-kernel-float).
- **`Float#inspect`**: implemented, parameters `[]`. Returns a string containing a representation of `self`; depending of the value of `self`, the string representation may contain: [An example calling it](/examples/addresses-internet-addresses).
- **`Float#magnitude`**: implemented, parameters `[]`. Returns the absolute value of `self`: [An example calling it](/examples/basics-floats-methods).
- **`Float#modulo`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a Float. [An example calling it](/examples/programs-calculator-calculator).
- **`Float#nan?`**: implemented, parameters `[]`. Returns `true` if `self` is a NaN, `false` otherwise. [An example calling it](/examples/builtins-kernel-float).
- **`Float#negative?`**: implemented, parameters `[]`. Returns `true` if `self` is less than 0, `false` otherwise. [An example calling it](/examples/basics-floats-methods).
- **`Float#next_float`**: implemented, parameters `[]`. Returns the next-larger representable Float. [An example calling it](/examples/basics-floats-methods).
- **`Float#numerator`**: implemented, parameters `[]`. Returns the numerator. [An example calling it](/examples/basics-complexes-protocol).
- **`Float#phase`**: implemented, parameters `[]`. Returns 0 if `self` is positive, Math::PI otherwise. [An example calling it](/examples/builtins-numeric-parts).
- **`Float#positive?`**: implemented, parameters `[]`. Returns `true` if `self` is greater than 0, `false` otherwise. [An example calling it](/examples/advanced-native-thread-ids).
- **`Float#prev_float`**: implemented, parameters `[]`. Returns the next-smaller representable Float. [An example calling it](/examples/basics-floats-methods).
- **`Float#quo`**: implemented, parameters `[[:req, :other]]`. Returns the quotient from dividing `self` by `other`: [An example calling it](/examples/builtins-integer-iteration).
- **`Float#rationalize`**: implemented, parameters `[[:rest, :limits]]`. Returns a simpler approximation of the value (flt-|eps| <= result <= flt+|eps|). [An example calling it](/examples/builtins-numeric-parts).
- **`Float#round`**: implemented, parameters `[[:rest]]`. Returns `self` rounded to the nearest value with a precision of `ndigits` decimal digits. [An example calling it](/examples/algorithms-average-temperature).
- **`Float#to_f`**: implemented, parameters `[[:rest, :args]]`. Returns `self` (which is already a Float). [An example calling it](/examples/basics-complexes-arithmetic).
- **`Float#to_i`**: implemented, parameters `[]`. Returns `self` truncated to an Integer. [An example calling it](/examples/addresses-internet-addresses).
- **`Float#to_int`**: implemented, parameters `[]`. Returns `self` truncated to an Integer. [An example calling it](/examples/builtins-kernel-argument-checks).
- **`Float#to_r`**: implemented, parameters `[]`. Returns the value as a rational. [An example calling it](/examples/basics-floats-methods).
- **`Float#to_s`**: implemented, parameters `[]`. Returns a string containing a representation of `self`; depending of the value of `self`, the string representation may contain: [An example calling it](/examples/addresses-internet-addresses).
- **`Float#truncate`**: implemented, parameters `[[:opt, :digits]]`. Returns `self` truncated (toward zero) to a precision of `ndigits` decimal digits. [An example calling it](/examples/basics-floats-methods).
- **`Float#zero?`**: implemented, parameters `[]`. Returns `true` if `self` is 0.0, `false` otherwise. [An example calling it](/examples/advanced-threads-take-turns).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
