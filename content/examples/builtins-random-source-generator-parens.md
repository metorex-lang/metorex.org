---
title: "builtins/random_source/generator_parens.rb"
slug: builtins-random-source-generator-parens
description: "The metorex example program builtins/random_source/generator_parens.rb and its output."
---

`tests/_examples/builtins/random_source/generator_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/random_source/generator_parens.rb){target=_blank rel=noopener}.

```metorex
# A seeded generator answers the same numbers Ruby's own does, since both
# draw from the Mersenne Twister.
p(Random.new(33).bytes(2))
p(Random.new(2 ** (63 * 4)).bytes(2))
p(Random.new(1234).rand)
p(Random.new(42).rand(0.0...100.0))
p(Random.new(42) == Random.new(42))
p(Random.new(42).seed)
p(Random.urandom(8).bytesize)
p(Random.new_seed.is_a?(Integer))

# A Range draws from the width between its ends, so an end that subtracts and
# adds bounds a draw of its own kind.
Kernel.srand(176542)
p(Kernel.rand(3..5).between?(3, 5))

Counter = Struct.new(:value) do
  def to_int
    value
  end

  def <=>(other)
    to_int <=> other.to_int
  end

  def -(other)
    self.class.new(to_int - other.to_int)
  end

  def +(other)
    self.class.new(to_int + other.to_int)
  end
end
p(rand(Counter.new(1)..Counter.new(42)).is_a?(Counter))
begin
  rand(Object.new..67)
rescue ArgumentError => problem
  p(problem.message)
end
```

Output:

```
"\x14\\"
"_\x91"
0.1915194503788923
37.454011884736246
true
42
8
true
true
true
"bad value for range"
```
