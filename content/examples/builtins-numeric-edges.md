---
title: "builtins/numeric_edges.rb"
slug: builtins-numeric-edges
description: "The metorex example program builtins/numeric_edges.rb and its output."
---

`tests/_examples/builtins/numeric_edges.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/numeric_edges.rb){target=_blank rel=noopener}.

```metorex
# A large Integer equals a Float only when the Float holds that exact value.
p((2**64) == 18446744073709551616.0)
p((2**64 + 1) == 18446744073709551616.0)

# A Complex with an imaginary part is not a real number for `rect` and
# `polar`.
begin
  Complex.rect(Complex(1, 2), 3)
rescue TypeError => problem
  p problem.message
end
p Complex.polar(0, 1.5)
p Complex.polar(2, Math::PI)

# An index too large for a long is refused by name.
begin
  [1, 2][2**64]
rescue RangeError => problem
  p problem.message
end
begin
  [1, 2][(2**64)..]
rescue RangeError => problem
  p problem.message
end

# A hash comparing by identity equals another only when both are empty.
p({}.compare_by_identity == {})
p({ a: 1 }.compare_by_identity == { a: 1 })

# A frozen Hash refuses a new entry.
begin
  {}.freeze[:a] = 1
rescue FrozenError => problem
  p problem.class
end
```

Output:

```
true
false
"not a real"
(0+0.0i)
(-2+0.0i)
"bignum too big to convert into 'long'"
"bignum too big to convert into 'long'"
true
false
FrozenError
```
