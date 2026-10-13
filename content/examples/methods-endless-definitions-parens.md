---
title: "methods/endless_definitions_parens.rb"
slug: methods-endless-definitions-parens
description: "The metorex example program methods/endless_definitions_parens.rb and its output."
---

`tests/_examples/methods/endless_definitions_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/endless_definitions_parens.rb){target=_blank rel=noopener}.

```metorex
def doubled(value) = value * 2
puts(doubled(21))

class Counter
  def self.zero = 0
  def value = 42
  def sum(a, b) = a + b
  def uses_other = value + 1
end

puts(Counter.zero)
puts(Counter.new.value)
puts(Counter.new.sum(1, 2))
puts(Counter.new.uses_other)

module Named
  def self.label = "named"
end

puts(Named.label)
```

Output:

```
42
0
42
3
43
named
```
