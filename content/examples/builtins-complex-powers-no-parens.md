---
title: "builtins/complex_powers_no_parens.rb"
slug: builtins-complex-powers-no-parens
description: "The metorex example program builtins/complex_powers_no_parens.rb and its output."
---

`tests/_examples/builtins/complex_powers_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/complex_powers_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A complex number raised to a power that is not a whole number, worked in
# polar form, and one raised by an object that coerces the pair.
p Complex(2, 1)**2
p Complex(3, 4)**0.0
p (Complex(3, 4)**2.5).rectangular.map { |part| part.round 6 }
p (Complex(2, 1)**Rational(3, 4)).rectangular.map { |part| part.round 6 }
p (Complex(2, 1)**Complex(2, 1)).rectangular.map { |part| part.round 6 }

class TwoAndFive
  def coerce(other)
    [2, 5]
  end
end

p Complex(3, 9)**TwoAndFive.new
```

Output:

```
(3+4i)
(1.0+0.0i)
[-38.0, 41.0]
[1.719133, 0.623125]
[-0.504825, 3.104144]
32
```
