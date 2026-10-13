---
title: "Numeric"
slug: numeric
description: "The methods ruby/spec describes in core/numeric, and which Metorex implements."
---

ruby/spec describes 47 methods in `core/numeric`, and Metorex implements 47 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Numeric#%`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a real numeric (Integer, Float, or Rational).
- **`Numeric#+@`**: implemented, parameters `[]`. Returns `self`.
- **`Numeric#-@`**: implemented, parameters `[]`. Returns `self`, negated.
- **`Numeric#<=>`**: implemented, parameters `[[:req]]`. Compares `self` and `other`.
- **`Numeric#abs`**: implemented, parameters `[]`. Returns the absolute value of `self`. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#abs2`**: implemented, parameters `[]`. Returns the square of `self`. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#angle`**: implemented, parameters `[]`. Returns zero if `self` is positive, Math::PI otherwise. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#arg`**: implemented, parameters `[]`. Returns zero if `self` is positive, Math::PI otherwise. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#ceil`**: implemented, parameters `[[:opt, :digits]]`. Returns the smallest float or integer that is greater than or equal to `self`, as specified by the given `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#clone`**: implemented, parameters `[[:key, :freeze]]`. Returns `self`. [An example calling it](/examples/basics-complexes-protocol).
- **`Numeric#coerce`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array containing two numeric elements, formed from the two operands `self` and `other`, of a common compatible type. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#conj`**: implemented, parameters `[]`. Returns `self`.
- **`Numeric#conjugate`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#denominator`**: implemented, parameters `[]`. Returns the denominator (always positive). [An example calling it](/examples/basics-complexes-protocol).
- **`Numeric#div`**: implemented, parameters `[[:req, :other]]`. Returns the quotient <code>self/other</code> as an integer (via `floor`), using method <code>/</code> as defined in the subclass of Numeric. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Numeric#divmod`**: implemented, parameters `[[:req, :other]]`. Returns a 2-element array <code>[q, r]</code>, where `q = (self/other).floor                  # Quotient`. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#dup`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Numeric#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `self` and `other` are the same type and have equal values. [An example calling it](/examples/array-methods-difference-of-structs).
- **`Numeric#fdiv`**: implemented, parameters `[[:req, :other]]`. Returns the quotient <code>self/other</code> as a float, using method <code>/</code> as defined in the subclass of Numeric. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#finite?`**: implemented, parameters `[]`. Returns `true` if `self` is a finite number, `false` otherwise. [An example calling it](/examples/builtins-kernel-float).
- **`Numeric#floor`**: implemented, parameters `[[:opt, :digits]]`. Returns the largest float or integer that is less than or equal to `self`, as specified by the given `ndigits`, which must be an integer-convertible object. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#i`**: implemented, parameters `[]`. Returns <code>Complex(0, self)</code>: [An example calling it](/examples/builtins-numeric-parts).
- **`Numeric#imag`**: implemented, parameters `[]`. Returns zero.
- **`Numeric#imaginary`**: implemented, parameters `[]`. Returns zero. [An example calling it](/examples/builtins-kernel-complex).
- **`Numeric#infinite?`**: implemented, parameters `[]`. Returns `nil`, -1, or 1 depending on whether `self` is finite, <code>-Infinity</code>, or <code>+Infinity</code>. [An example calling it](/examples/builtins-kernel-float).
- **`Numeric#integer?`**: implemented, parameters `[]`. Returns `true` if `self` is an Integer. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Numeric#magnitude`**: implemented, parameters `[]`. Returns the absolute value of `self`. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#modulo`**: implemented, parameters `[[:req, :other]]`. Returns `self` modulo `other` as a real numeric (Integer, Float, or Rational). [An example calling it](/examples/programs-calculator-calculator).
- **`Numeric#negative?`**: implemented, parameters `[]`. Returns `true` if `self` is less than 0, `false` otherwise. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#nonzero?`**: implemented, parameters `[]`. Returns `self` if `self` is not a zero value, `nil` otherwise; uses method <code>zero?</code> for the evaluation. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Numeric#numerator`**: implemented, parameters `[]`. Returns the numerator. [An example calling it](/examples/basics-complexes-protocol).
- **`Numeric#phase`**: implemented, parameters `[]`. Returns zero if `self` is positive, Math::PI otherwise. [An example calling it](/examples/builtins-numeric-parts).
- **`Numeric#polar`**: implemented, parameters `[]`. Returns array <code>[self.abs, self.arg]</code>. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#positive?`**: implemented, parameters `[]`. Returns `true` if `self` is greater than 0, `false` otherwise. [An example calling it](/examples/advanced-native-thread-ids).
- **`Numeric#quo`**: implemented, parameters `[[:req, :other]]`. Returns the most exact division (rational for integers, float for floats). [An example calling it](/examples/builtins-integer-iteration).
- **`Numeric#real`**: implemented, parameters `[]`. Returns `self`. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Numeric#real?`**: implemented, parameters `[]`. Returns `true` if `self` is a real number (i.e. [An example calling it](/examples/basics-floats-numeric-protocol).
- **`Numeric#rect`**: implemented, parameters `[]`. Returns array <code>[self, 0]</code>. [An example calling it](/examples/basics-complexes-arithmetic).
- **`Numeric#rectangular`**: implemented, parameters `[]`. Returns array <code>[self, 0]</code>. [An example calling it](/examples/basics-exact-powers).
- **`Numeric#remainder`**: implemented, parameters `[[:req, :other]]`. Returns the remainder after dividing `self` by `other`. [An example calling it](/examples/basics-integers-division).
- **`Numeric#round`**: implemented, parameters `[[:opt, :digits]]`. Returns `self` rounded to the nearest value with a precision of `digits` decimal digits. [An example calling it](/examples/algorithms-average-temperature).
- **`Numeric#singleton_method_added`**: implemented, parameters `[[:req, :name]]`. Invoked as a callback whenever a singleton method is added to the receiver. [An example calling it](/examples/metaprogramming-singleton-hooks-added).
- **`Numeric#step`**: implemented, parameters `[[:opt, :limit], [:opt, :by], [:keyrest, :options], [:block, :block]]`. Generates a sequence of numbers; with a block given, traverses the sequence. [An example calling it](/examples/array-methods-strided-slices).
- **`Numeric#to_c`**: implemented, parameters `[]`. Returns `self` as a Complex object. [An example calling it](/examples/builtins-numeric-parts).
- **`Numeric#to_int`**: implemented, parameters `[]`. Returns `self` as an integer; converts using method `to_i` in the subclass of Numeric. [An example calling it](/examples/builtins-kernel-argument-checks).
- **`Numeric#truncate`**: implemented, parameters `[[:opt, :digits]]`. Returns `self` truncated (toward zero) to a precision of `digits` decimal digits. [An example calling it](/examples/basics-floats-methods).
- **`Numeric#zero?`**: implemented, parameters `[]`. Returns `true` if `zero` has a zero value, `false` otherwise. [An example calling it](/examples/advanced-threads-take-turns).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
