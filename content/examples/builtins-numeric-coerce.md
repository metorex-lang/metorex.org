---
title: "builtins/numeric_coerce.rb"
slug: builtins-numeric-coerce
description: "The metorex example program builtins/numeric_coerce.rb and its output."
---

`tests/_examples/builtins/numeric_coerce.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/numeric_coerce.rb).

```metorex
# Numeric#coerce pairs two values of the same class as they are, and turns
# both into Floats otherwise. A value given a singleton class answers to that
# class, so it is no longer the same class as its sibling. A number refuses
# a singleton method, which is taken away again before the error is raised.
class Measure < Numeric
  def initialize(amount)
    @amount = amount
  end

  def to_f
    @amount.to_f
  end
end

first = Measure.new(2)
second = Measure.new(3)
p(first.coerce(second).map(&:to_f))
p(first.coerce(4))

begin
  def first.unit
    "meters"
  end
rescue TypeError => error
  puts(error.message)
end
p(first.coerce(second))

lone = Class.new(Numeric).new
lone.singleton_class
begin
  lone.coerce(lone.class.new)
rescue TypeError => error
  puts(error.message == "can't convert #{lone.class.inspect} into Float")
end
```

Output:

```
[3.0, 2.0]
[4.0, 2.0]
can't define singleton method "unit" for Measure
[3.0, 2.0]
true
```
