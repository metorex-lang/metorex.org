---
title: "oop/comparable/comparable.rb"
slug: oop-comparable-comparable
description: "The metorex example program oop/comparable/comparable.rb and its output."
---

`tests/_examples/oop/comparable/comparable.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/comparable/comparable.rb).

```metorex
# Comparable module with spaceship operator
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

a = Weight.new 10
b = Weight.new 20

puts a < b
puts a > b
puts a <= b
puts a >= b
puts b > a
puts b >= a
puts a < a
puts a <= a
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
