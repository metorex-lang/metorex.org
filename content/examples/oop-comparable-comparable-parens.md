---
title: "oop/comparable/comparable_parens.rb"
slug: oop-comparable-comparable-parens
description: "The metorex example program oop/comparable/comparable_parens.rb and its output."
---

`tests/_examples/oop/comparable/comparable_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/comparable/comparable_parens.rb){target=_blank rel=noopener}.

```metorex
# Comparable module with spaceship operator (parens)
class Weight
  include Comparable

  attr_accessor :value

  def initialize(v)
    @value = v
  end

  def <=>(other)
    @value <=> other.value
  end
end

a = Weight.new(10)
b = Weight.new(20)

puts(a < b)
puts(a > b)
puts(a <= b)
puts(a >= b)
puts(b > a)
puts(b >= a)
puts(a < a)
puts(a <= a)
```

Output:

```
true
false
true
false
true
true
false
true
```
