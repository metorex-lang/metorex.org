---
title: "basics/whole_number_limits_parens.rb"
slug: basics-whole-number-limits-parens
description: "The metorex example program basics/whole_number_limits_parens.rb and its output."
---

`tests/_examples/basics/whole_number_limits_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/whole_number_limits_parens.rb){target=_blank rel=noopener}.

```metorex
# A shift reads its count through `to_int`, and a count too wide for a machine
# word shifts everything out or fills with the sign.
class Four
  def to_int
    4
  end
end
p(3 << Four.new)
p(3 << -(2**64))
p(3 >> (2**64))
p(0 << (2**64))

# Raising to a power answers exactly, and one whose answer would be too wide
# to build is refused.
p((2 ** 70).bit_length)
begin
  100000000 ** 1000000000
rescue ArgumentError => trouble
  p(trouble.message)
end
p(1 ** (2**64))
p((-1) ** (2**64))
begin
  0 ** -1
rescue ZeroDivisionError => trouble
  p(trouble.message)
end
p(0 ** -1.0)
p(2 ** Rational(2, 1))
p(2 ** Rational(1, 2))

# `div` hands the pair a `coerce` answers to `div` rather than to `/`.
class Halved
  def coerce(other)
    [other * 2, 2]
  end
end
p(10.div(Halved.new))

# `pow` takes a modulus, and a second argument that is not an Integer is
# refused even when it is nil.
p(2.pow(10, 1000))
begin
  2.pow(5, nil)
rescue TypeError => trouble
  p(trouble.message)
end
```

Output:

```
48
0
0
0
71
"exponent is too large"
1
1
"divided by 0"
Infinity
(4/1)
1.4142135623730951
10
24
"Integer#pow() 2nd argument not allowed unless all arguments are integers"
```
