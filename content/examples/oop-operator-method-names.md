---
title: "oop/operator_method_names.rb"
slug: oop-operator-method-names
description: "The metorex example program oop/operator_method_names.rb and its output."
---

`tests/_examples/oop/operator_method_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/operator_method_names.rb){target=_blank rel=noopener}.

```metorex
class Weight
  attr_reader :grams

  def initialize(grams)
    @grams = grams
  end

  def <=>(other)
    grams <=> other.grams
  end

  def +(other)
    Weight.new(grams + other.grams)
  end

  def [](index)
    index * grams
  end
end

light = Weight.new(10)
heavy = Weight.new(20)

puts light.<=>(heavy)
puts heavy.<=>(light)
puts light.+(heavy).grams
puts light.[](3)
puts 4.+(5)
puts 4.<=>(5)

anything = Object.new
puts anything.<=>(anything)
puts anything.<=>(Object.new).inspect
puts anything.<=>(3.14).inspect
```

Output:

```
-1
1
30
30
9
-1
0
nil
nil
```
