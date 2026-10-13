---
title: "Math"
slug: math
description: "The methods ruby/spec describes in core/math, and which Metorex implements."
---

ruby/spec describes 52 methods in `core/math`, and Metorex implements 52 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Math#acos`**: implemented, parameters `[[:req, :x]]`. Returns the [arc cosine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math.acos`**: implemented, parameters `[[:req, :x]]`. Returns the [arc cosine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math#acosh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic cosine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math.acosh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic cosine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math#asin`**: implemented, parameters `[[:req, :x]]`. Returns the [arc sine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math.asin`**: implemented, parameters `[[:req, :x]]`. Returns the [arc sine](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math#asinh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic sine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math.asinh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic sine](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math#atan`**: implemented, parameters `[[:req, :x]]`. Returns the [arc tangent](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math.atan`**: implemented, parameters `[[:req, :x]]`. Returns the [arc tangent](https://en.wikipedia.org/wiki/Inverse_trigonometric_functions){target=_blank rel=noopener} of `x`.
- **`Math#atan2`**: implemented, parameters `[[:req, :y], [:req, :x]]`. Returns the [arc tangent](https://en.wikipedia.org/wiki/Atan2){target=_blank rel=noopener} of `y` and `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.atan2`**: implemented, parameters `[[:req, :y], [:req, :x]]`. Returns the [arc tangent](https://en.wikipedia.org/wiki/Atan2){target=_blank rel=noopener} of `y` and `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#atanh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic tangent](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math.atanh`**: implemented, parameters `[[:req, :x]]`. Returns the [inverse hyperbolic tangent](https://en.wikipedia.org/wiki/Inverse_hyperbolic_functions){target=_blank rel=noopener} of `x`.
- **`Math.cbrt`**: implemented, parameters `[[:req, :x]]`. Returns the [cube root](https://en.wikipedia.org/wiki/Cube_root){target=_blank rel=noopener} of `x`. [An example calling it](/examples/stdlib-math-functions).
- **`Math#cos`**: implemented, parameters `[[:req, :x]]`. Returns the [cosine](https://en.wikipedia.org/wiki/Sine_and_cosine){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.cos`**: implemented, parameters `[[:req, :x]]`. Returns the [cosine](https://en.wikipedia.org/wiki/Sine_and_cosine){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#cosh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic cosine](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.cosh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic cosine](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#erf`**: implemented, parameters `[[:req, :x]]`. Returns the value of the [Gauss error function](https://en.wikipedia.org/wiki/Error_function){target=_blank rel=noopener} for `x`.
- **`Math.erf`**: implemented, parameters `[[:req, :x]]`. Returns the value of the [Gauss error function](https://en.wikipedia.org/wiki/Error_function){target=_blank rel=noopener} for `x`.
- **`Math#erfc`**: implemented, parameters `[[:req, :x]]`. Returns the value of the [complementary error function](https://en.wikipedia.org/wiki/Error_function#Complementary_error_fun ction) for `x`.
- **`Math.erfc`**: implemented, parameters `[[:req, :x]]`. Returns the value of the [complementary error function](https://en.wikipedia.org/wiki/Error_function#Complementary_error_fun ction) for `x`.
- **`Math#exp`**: implemented, parameters `[[:req, :x]]`. Returns `e` raised to the `x` power. [An example calling it](/examples/stdlib-bigdecimal-arithmetic).
- **`Math.exp`**: implemented, parameters `[[:req, :x]]`. Returns `e` raised to the `x` power. [An example calling it](/examples/stdlib-math-functions).
- **`Math#expm1`**: implemented, parameters `[[:req, :x]]`. Returns "exp(x) - 1", `e` raised to the `x` power, minus 1.
- **`Math.expm1`**: implemented, parameters `[[:req, :x]]`. Returns "exp(x) - 1", `e` raised to the `x` power, minus 1.
- **`Math#frexp`**: implemented, parameters `[[:req, :x]]`. Returns a 2-element array containing the normalized signed float `fraction` and integer `exponent` of `x` such that: [An example calling it](/examples/stdlib-math-functions).
- **`Math.frexp`**: implemented, parameters `[[:req, :x]]`. Returns a 2-element array containing the normalized signed float `fraction` and integer `exponent` of `x` such that: [An example calling it](/examples/stdlib-math-functions).
- **`Math.gamma`**: implemented, parameters `[[:req, :x]]`. Returns the value of the [gamma function](https://en.wikipedia.org/wiki/Gamma_function){target=_blank rel=noopener} for `x`.
- **`Math#hypot`**: implemented, parameters `[[:req, :x], [:req, :y]]`. Returns <code>sqrt(a**2 + b**2)</code>, which is the length of the longest side `c` (the hypotenuse) of the right triangle whose other sides have lengths `a` and `b`. [An example calling it](/examples/stdlib-math-functions).
- **`Math.hypot`**: implemented, parameters `[[:req, :x], [:req, :y]]`. Returns <code>sqrt(a**2 + b**2)</code>, which is the length of the longest side `c` (the hypotenuse) of the right triangle whose other sides have lengths `a` and `b`. [An example calling it](/examples/stdlib-math-functions).
- **`Math#ldexp`**: implemented, parameters `[[:req, :fraction], [:req, :exponent]]`. Returns the value of <code>fraction * 2**exponent</code>. [An example calling it](/examples/stdlib-math-functions).
- **`Math.ldexp`**: implemented, parameters `[[:req, :fraction], [:req, :exponent]]`. Returns the value of <code>fraction * 2**exponent</code>. [An example calling it](/examples/stdlib-math-functions).
- **`Math.lgamma`**: implemented, parameters `[[:req, :x]]`. Returns a 2-element array equivalent to: [An example calling it](/examples/builtins-core-state-and-time).
- **`Math#log`**: implemented, parameters `[[:req, :x], [:rest, :base]]`. Returns the base `base` [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of `x`. [An example calling it](/examples/errors-highlight-keyword).
- **`Math.log`**: implemented, parameters `[[:req, :x], [:rest, :base]]`. Returns the base `base` [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of `x`. [An example calling it](/examples/stdlib-math-functions).
- **`Math#log10`**: implemented, parameters `[[:req, :x]]`. Returns the base 10 [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of `x`. [An example calling it](/examples/stdlib-math-functions).
- **`Math.log10`**: implemented, parameters `[[:req, :x]]`. Returns the base 10 [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of `x`. [An example calling it](/examples/stdlib-math-functions).
- **`Math#log1p`**: implemented, parameters `[[:req, :x]]`. Returns "log(x + 1)", the base E [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of (`x` + 1).
- **`Math.log1p`**: implemented, parameters `[[:req, :x]]`. Returns "log(x + 1)", the base E [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of (`x` + 1).
- **`Math.log2`**: implemented, parameters `[[:req, :x]]`. Returns the base 2 [logarithm](https://en.wikipedia.org/wiki/Logarithm){target=_blank rel=noopener} of `x`. [An example calling it](/examples/stdlib-math-functions).
- **`Math#sin`**: implemented, parameters `[[:req, :x]]`. Returns the [sine](https://en.wikipedia.org/wiki/Sine_and_cosine){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.sin`**: implemented, parameters `[[:req, :x]]`. Returns the [sine](https://en.wikipedia.org/wiki/Sine_and_cosine){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#sinh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic sine](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.sinh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic sine](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#sqrt`**: implemented, parameters `[[:req, :x]]`. Returns the principal (non-negative) [square root](https://en.wikipedia.org/wiki/Square_root){target=_blank rel=noopener} of `x`. [An example calling it](/examples/basics-integers-division).
- **`Math.sqrt`**: implemented, parameters `[[:req, :x]]`. Returns the principal (non-negative) [square root](https://en.wikipedia.org/wiki/Square_root){target=_blank rel=noopener} of `x`. [An example calling it](/examples/runtime-instances).
- **`Math#tan`**: implemented, parameters `[[:req, :x]]`. Returns the [tangent](https://en.wikipedia.org/wiki/Trigonometric_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.tan`**: implemented, parameters `[[:req, :x]]`. Returns the [tangent](https://en.wikipedia.org/wiki/Trigonometric_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math#tanh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic tangent](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).
- **`Math.tanh`**: implemented, parameters `[[:req, :x]]`. Returns the [hyperbolic tangent](https://en.wikipedia.org/wiki/Hyperbolic_functions){target=_blank rel=noopener} of `x` in [radians](https://en.wikipedia.org/wiki/Trigonometric_functions#Radians_versus _degrees).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
