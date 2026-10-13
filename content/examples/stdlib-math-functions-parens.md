---
title: "stdlib/math/functions_parens.rb"
slug: stdlib-math-functions-parens
description: "The metorex example program stdlib/math/functions_parens.rb and its output."
---

`tests/_examples/stdlib/math/functions_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/math/functions_parens.rb).

```metorex
# Math's functions are module functions, so both `Math.sqrt` and a private
# `sqrt` inside a class that includes Math reach the same one.
p(Math.sqrt(4))
p(Math.cbrt(27))
p(Math.hypot(3, 4))
p(Math.log(1))
p(Math.log(8, 2))
p(Math.log2(8))
p(Math.log10(1000))
p(Math.exp(0))
p(Math.frexp(1234))
p(Math.ldexp(0.6025390625, 11))

class Distance
  include Math

  def initialize(x, y)
    @x = x
    @y = y
  end

  def length
    sqrt(@x * @x + @y * @y)
  end
end

p(Distance.new(3, 4).length)
p(Math.private_instance_methods.include?(:sqrt))

# A logarithm of a number too wide for a Float keeps the digits the Float
# cannot hold.
p(Math.log2(2 ** 10001))

# An argument outside a function's domain, and one that is not a number at
# all, are each refused.
begin
  Math.sqrt(-1)
rescue Math::DomainError => error
  puts(error.message)
end

begin
  Math.sqrt("four")
rescue TypeError => error
  puts(error.message)
end

p(Math.sqrt(0.0 / 0.0).nan?)
```

Output:

```
2.0
3.0
5.0
0.0
3.0
3.0
3.0
1.0
[0.6025390625, 11]
1234.0
5.0
true
10001.0
Numerical argument is out of domain - "sqrt"
can't convert String into Float
true
```
