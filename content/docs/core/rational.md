---
title: "Rational"
slug: rational
description: "The methods ruby/spec describes in core/rational, and which Metorex implements."
---

ruby/spec describes 31 methods in `core/rational`, and Metorex implements 31 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Rational#%`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a real numeric (Integer, Float, or Rational).
- **`Rational#*`**: implemented, parameters `[[:req]]`. Returns the numeric product of `self` and `other`:
- **`Rational#**`**: implemented, parameters `[[:req]]`. Returns `self` raised to the power `exponent`:
- **`Rational#+`**: implemented, parameters `[[:req]]`. Returns the sum of `self` and `other`:
- **`Rational#-`**: implemented, parameters `[[:req]]`. Returns the difference of `self` and `other`:
- **`Rational#/`**: implemented, parameters `[[:req]]`. Returns the quotient of `self` and `other`:
- **`Rational#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`.
- **`Rational#==`**: implemented, parameters `[[:req]]`. Returns `true` if `rat` equals `object` numerically.
- **`Rational#abs`**: implemented, parameters `[]`. Returns the absolute value of `rat`. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Rational#ceil`**: implemented, parameters `[[:opt, :digits]]`. Returns the smallest number greater than or equal to `rat` with a precision of `ndigits` decimal digits (default: 0). [An example calling it](/examples/basics-floats-methods).
- **`Rational#denominator`**: implemented, parameters `[]`. Returns the denominator (always positive). [An example calling it](/examples/basics-complexes-protocol).
- **`Rational#div`**: implemented, parameters `[[:req, :other]]`. Returns the quotient <code>self/other</code> as an integer (via `floor`), using method <code>/</code> as defined in the subclass of Numeric. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Rational#divmod`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array <code>[q, r]</code>, where `q = (self/other).floor                  # Quotient`. [An example calling it](/examples/basics-floats-methods).
- **`Rational#fdiv`**: implemented, parameters `[[:req, :other]]`. Performs division and returns the value as a Float. [An example calling it](/examples/basics-floats-methods).
- **`Rational#floor`**: implemented, parameters `[[:opt, :digits]]`. Returns the largest number less than or equal to `rat` with a precision of `ndigits` decimal digits (default: 0). [An example calling it](/examples/basics-floats-methods).
- **`Rational#hash`**: implemented, parameters `[]`. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Rational#inspect`**: implemented, parameters `[]`. Returns the value as a string for inspection. [An example calling it](/examples/addresses-internet-addresses).
- **`Rational#integer?`**: implemented, parameters `[]`. Returns `true` if `self` is an Integer. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Rational#magnitude`**: implemented, parameters `[]`. Returns the absolute value of `rat`. [An example calling it](/examples/basics-floats-methods).
- **`Rational#marshal_dump`**: implemented, parameters `[]`.
- **`Rational#numerator`**: implemented, parameters `[]`. Returns the numerator. [An example calling it](/examples/basics-complexes-protocol).
- **`Rational#quo`**: implemented, parameters `[[:req, :other]]`. Returns the quotient of `self` and `other`: [An example calling it](/examples/builtins-integer-iteration).
- **`Rational#rationalize`**: implemented, parameters `[[:rest, :limits]]`. Returns a simpler approximation of the value if the optional argument `eps` is given (rat-|eps| <= result <= rat+|eps|), self otherwise. [An example calling it](/examples/builtins-numeric-parts).
- **`Rational#remainder`**: implemented, parameters `[[:req, :other]]`. Returns the remainder after dividing `self` by `other`. [An example calling it](/examples/basics-integers-division).
- **`Rational#round`**: implemented, parameters `[[:opt, :digits]]`. Returns `rat` rounded to the nearest value with a precision of `ndigits` decimal digits (default: 0). [An example calling it](/examples/algorithms-average-temperature).
- **`Rational#to_f`**: implemented, parameters `[]`. Returns the value as a Float. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Rational#to_i`**: implemented, parameters `[]`. Returns the truncated value as an integer. [An example calling it](/examples/addresses-internet-addresses).
- **`Rational#to_r`**: implemented, parameters `[]`. Returns self. [An example calling it](/examples/basics-floats-methods).
- **`Rational#to_s`**: implemented, parameters `[]`. Returns the value as a string. [An example calling it](/examples/addresses-internet-addresses).
- **`Rational#truncate`**: implemented, parameters `[[:opt, :digits]]`. Returns `rat` truncated (toward zero) to a precision of `ndigits` decimal digits (default: 0). [An example calling it](/examples/basics-floats-methods).
- **`Rational#zero?`**: implemented, parameters `[]`. Returns `true` if `zero` has a zero value, `false` otherwise. [An example calling it](/examples/advanced-threads-take-turns).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
