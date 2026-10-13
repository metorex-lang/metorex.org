---
title: "Complex"
slug: complex
description: "The methods ruby/spec describes in core/complex, and which Metorex implements."
---

ruby/spec describes 46 methods in `core/complex`, and Metorex implements 44 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Complex#*`**: implemented, parameters `[[:req]]`. Returns the numeric product of `self` and `other`:
- **`Complex#**`**: implemented, parameters `[[:req]]`. Returns `self` raised to the power `exponent`:
- **`Complex#+`**: implemented, parameters `[[:req]]`. Returns the sum of `self` and `other`:
- **`Complex#-`**: implemented, parameters `[[:req]]`. Returns the difference of `self` and `other`:
- **`Complex#-@`**: implemented, parameters `[]`. Returns `self`, negated, which is the negation of each of its parts:
- **`Complex#/`**: implemented, parameters `[[:req]]`. Returns the quotient of `self` and `other`:
- **`Complex#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`.
- **`Complex#==`**: implemented, parameters `[[:req]]`. Returns `true` if <code>self.real == object.real</code> and <code>self.imag == object.imag</code>:
- **`Complex#abs`**: implemented, parameters `[]`. Returns the absolute value (magnitude) for `self`; see polar coordinates: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex#abs2`**: implemented, parameters `[]`. Returns square of the absolute value (magnitude) for `self`; see polar coordinates: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex#angle`**: implemented, parameters `[]`. Returns the argument (angle) for `self` in radians; see polar coordinates: [An example calling it](/examples/basics-floats-methods).
- **`Complex#arg`**: implemented, parameters `[]`. Returns the argument (angle) for `self` in radians; see polar coordinates: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex#coerce`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array containing two numeric elements, formed from the two operands `self` and `other`, of a common compatible type. [An example calling it](/examples/basics-floats-methods).
- **`Complex#conj`**: implemented, parameters `[]`. Returns the conjugate of `self`, <code>Complex.rect(self.imag, self.real)</code>:
- **`Complex#conjugate`**: implemented, parameters `[]`. Returns the conjugate of `self`, <code>Complex.rect(self.imag, self.real)</code>: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex#denominator`**: implemented, parameters `[]`. Returns the denominator of `self`, which is the [least common multiple](https://en.wikipedia.org/wiki/Least_common_multiple){target=_blank rel=noopener} of <code>self.real.denominator</code> and <code>self.imag.denominator</code>: [An example calling it](/examples/basics-complexes-protocol).
- **`Complex#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `self` and `other` are the same type and have equal values. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Complex#fdiv`**: implemented, parameters `[[:req, :other]]`. Returns <code>Complex.rect(self.real/numeric, self.imag/numeric)</code>: [An example calling it](/examples/basics-floats-methods).
- **`Complex#finite?`**: implemented, parameters `[]`. Returns `true` if both <code>self.real.finite?</code> and <code>self.imag.finite?</code> are true, `false` otherwise: [An example calling it](/examples/builtins-kernel-float).
- **`Complex#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Complex#imag`**: implemented, parameters `[]`. Returns the imaginary value for `self`:
- **`Complex#imaginary`**: implemented, parameters `[]`. Returns the imaginary value for `self`: [An example calling it](/examples/builtins-kernel-complex).
- **`Complex#infinite?`**: implemented, parameters `[]`. Returns `1` if either <code>self.real.infinite?</code> or <code>self.imag.infinite?</code> is true, `nil` otherwise: [An example calling it](/examples/builtins-kernel-float).
- **`Complex#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Complex#integer?`**: implemented, parameters `[]`. Returns `true` if `self` is an Integer. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Complex#magnitude`**: implemented, parameters `[]`. Returns the absolute value (magnitude) for `self`; see polar coordinates: [An example calling it](/examples/basics-floats-methods).
- **`Complex#marshal_dump`**: implemented, parameters `[]`.
- **`Complex#negative?`**: not implemented. Returns `true` if `self` is less than 0, `false` otherwise. [An example calling it](/examples/basics-floats-methods).
- **`Complex#numerator`**: implemented, parameters `[]`. Returns the Complex object created from the numerators of the real and imaginary parts of `self`, after converting each part to the [lowest common denominator](https://en.wikipedia.org/wiki/Lowest_common_denominator){target=_blank rel=noopener} of the two: [An example calling it](/examples/basics-complexes-protocol).
- **`Complex#phase`**: implemented, parameters `[]`. Returns the argument (angle) for `self` in radians; see polar coordinates: [An example calling it](/examples/builtins-numeric-parts).
- **`Complex#polar`**: implemented, parameters `[]`. Returns the array <code>[self.abs, self.arg]</code>: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex.polar`**: implemented, parameters `[[:req, :args]]`. Returns a new Complex object formed from the arguments, each of which must be an instance of Numeric, or an instance of one of its subclasses: Complex, Float, Integer, Rational. [An example calling it](/examples/builtins-numeric-edges).
- **`Complex#positive?`**: not implemented. Returns `true` if `self` is greater than 0, `false` otherwise. [An example calling it](/examples/advanced-native-thread-ids).
- **`Complex#quo`**: implemented, parameters `[[:req, :other]]`. Returns the quotient of `self` and `other`: [An example calling it](/examples/builtins-integer-iteration).
- **`Complex#rationalize`**: implemented, parameters `[[:rest]]`. Returns a Rational object whose value is exactly or approximately equivalent to that of <code>self.real</code>. [An example calling it](/examples/builtins-numeric-parts).
- **`Complex#real`**: implemented, parameters `[]`. Returns the real value for `self`: [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Complex#real?`**: implemented, parameters `[]`. Returns `false`; for compatibility with Numeric#real?. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Complex#rect`**: implemented, parameters `[]`. Returns a new Complex object formed from the arguments, each of which must be an instance of Numeric, or an instance of one of its subclasses: Complex, Float, Integer, Rational; see Rectangular Coordinates: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex.rect`**: implemented, parameters `[[:req, :args]]`. Returns a new Complex object formed from the arguments, each of which must be an instance of Numeric, or an instance of one of its subclasses: Complex, Float, Integer, Rational; see Rectangular Coordinates: [An example calling it](/examples/builtins-numeric-edges).
- **`Complex#rectangular`**: implemented, parameters `[]`. Returns the array <code>[self.real, self.imag]</code>: [An example calling it](/examples/basics-exact-powers).
- **`Complex.rectangular`**: implemented, parameters `[[:req, :args]]`. Returns a new Complex object formed from the arguments, each of which must be an instance of Numeric, or an instance of one of its subclasses: Complex, Float, Integer, Rational; see Rectangular Coordinates:
- **`Complex#to_c`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/builtins-numeric-parts).
- **`Complex#to_f`**: implemented, parameters `[]`. Returns the value of <code>self.real</code> as a Float, if possible: [An example calling it](/examples/basics-complexes-arithmetic).
- **`Complex#to_i`**: implemented, parameters `[]`. Returns the value of <code>self.real</code> as an Integer, if possible: [An example calling it](/examples/addresses-internet-addresses).
- **`Complex#to_r`**: implemented, parameters `[]`. Returns the value of <code>self.real</code> as a Rational, if possible: [An example calling it](/examples/basics-floats-methods).
- **`Complex#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
