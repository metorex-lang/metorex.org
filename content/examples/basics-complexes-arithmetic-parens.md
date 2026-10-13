---
title: "basics/complexes/arithmetic_parens.rb"
slug: basics-complexes-arithmetic-parens
description: "The metorex example program basics/complexes/arithmetic_parens.rb and its output."
---

`tests/_examples/basics/complexes/arithmetic_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/complexes/arithmetic_parens.rb).

```metorex
# The four operations compose the two parts of each operand.
a = Complex(1, 2)
b = Complex(3, 4)
p(a + b)
p(a - b)
p(a * b)
p(a / b)
p(a ** 2)

# A real number on either side is the number with nothing on the imaginary
# axis.
p(a + 1)
p(1 + a)
p(a * 2)

# The magnitude, the square of it, and the direction the number points.
p(Complex(3, 4).abs)
p(Complex(3, 4).abs2)
p(Complex(0, 1).arg == Math::PI / 2)
p(Complex(3, 4).polar.first)
p(Complex(3, 4).rect)

p(a.conjugate)
p(-a)

# A Complex is only a real number when nothing is left on the imaginary axis.
p(Complex(3, 0).to_i)
begin
  Complex(3, 1).to_f
rescue RangeError => error
  puts(error.message)
end

# A Float part is never exact enough to drop.
begin
  Complex(3, 0.0).to_i
rescue RangeError => error
  puts(error.message)
end

# `eql?` is equality without conversion, where `==` reads a real number as the
# Complex it stands for.
p(Complex(3, 0) == 3)
p(Complex(3, 0).eql?(3))
p(Complex(1, 2).to_s)
```

Output:

```
(4+6i)
(-2-2i)
(-5+10i)
((11/25)+(2/25)*i)
(-3+4i)
(2+2i)
(2+2i)
(2+4i)
5.0
25
true
5.0
[3, 4]
(1-2i)
(-1-2i)
3
can't convert 3+1i into Float
can't convert 3+0.0i into Integer
true
false
"1+2i"
```
