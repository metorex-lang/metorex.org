---
title: "stdlib/bigdecimal_arithmetic_no_parens.rb"
slug: stdlib-bigdecimal-arithmetic-no-parens
description: "The metorex example program stdlib/bigdecimal_arithmetic_no_parens.rb and its output."
---

`tests/_examples/stdlib/bigdecimal_arithmetic_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/bigdecimal_arithmetic_no_parens.rb).

```metorex
# How BigDecimal divides, reads text and Floats, and takes logarithms: a
# quotient carries the digits of its wider operand and sixteen more, divmod
# answers an Integer quotient, and BigMath works to the digits asked for.
require "bigdecimal"
require "bigdecimal/util"

one = BigDecimal "1"
three = BigDecimal "3"
p one / three
large = BigDecimal "2E55"
wide = BigDecimal "1.23456789E10"
p large / wide
p large.precision
p (BigDecimal "0.001").precision

quotient, left_over = (BigDecimal "42").divmod BigDecimal "9"
p [quotient, quotient.class, left_over]
p (BigDecimal "-7").divmod BigDecimal "Infinity"
begin
  (BigDecimal "NaN").divmod 1
rescue FloatDomainError => error
  p error.class
end

p BigDecimal "12_345.67E8_9"
p BigDecimal "1_"
begin
  BigDecimal "1__2"
rescue ArgumentError => error
  p error.message
end
p BigDecimal "invalid", exception: false
p BigDecimal 0.1
p BigDecimal 1.0 / 3, 5
p (BigDecimal -0.0).sign
p 1.5.to_d

module LoudDecimal
  def to_s(*)
    "loud"
  end
end
BigDecimal.prepend LoudDecimal
loud = BigDecimal "44.44"
p [loud.to_s, loud.inspect]

p BigMath.log (BigDecimal "2"), 30
p BigMath.exp (BigDecimal "1"), 30
ratio = Rational 1_234_567_890, 987_654_321
p BigMath.log ratio, 20

three_quarters = Rational 3, 4
p three_quarters.coerce 1.5
p three_quarters.coerce 10
quarter = Rational 1, 4
p Float quarter
```

Output:

```
0.33333333333333333333333333333333e0
0.162000001474200013415220122078503110914378309320842614819667794858976933e46
56
3
[4, Integer, 0.6e1]
[-1, Infinity]
FloatDomainError
0.1234567e94
0.1e1
"invalid value for BigDecimal(): \"1__2\""
nil
0.1e0
0.33333e0
-1
0.15e1
["loud", "0.4444e2"]
0.693147180559945309417232121458e0
0.271828182845904523536028747135e1
0.22314354220170971436e0
[1.5, 0.75]
[(10/1), (3/4)]
0.25
```
