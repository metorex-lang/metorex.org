---
title: "basics/integers/comparison_and_scope_parens.rb"
slug: basics-integers-comparison-and-scope-parens
description: "The metorex example program basics/integers/comparison_and_scope_parens.rb and its output."
---

`tests/_examples/basics/integers/comparison_and_scope_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/integers/comparison_and_scope_parens.rb){target=_blank rel=noopener}.

```metorex
# Comparable is mixed into the classes whose values have an order.
p(Integer.include?(Comparable))
p(Integer.ancestors)
p(String.include?(Comparable))

# A number compared against something that is not one answers by asking that
# object, and has no ordering against it at all.
class Measure
  def initialize(value)
    @value = value
  end

  def ==(other)
    other == @value
  end
end

p(5 == Measure.new(5))
p(5 == Measure.new(6))
p(5 <=> "five")

# `Foo::bar` names a method when the name is lowercase, and a constant when it
# is capitalized.
module Units
  METRIC = "metric"

  def self.name_of(value)
    "#{value} #{METRIC}"
  end
end

puts(Units::name_of(3))
puts(Units::METRIC)

# An Integer is its own numerator over a denominator of one.
p(34.numerator)
p(34.denominator)
p(34.to_r)
p(34.size)
```

Output:

```
true
[Integer, Numeric, Comparable, Object, Kernel, BasicObject]
true
true
false
nil
3 metric
metric
34
1
(34/1)
8
```
