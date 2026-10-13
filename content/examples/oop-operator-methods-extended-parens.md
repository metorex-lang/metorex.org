---
title: "oop/operator_methods/extended_parens.rb"
slug: oop-operator-methods-extended-parens
description: "The metorex example program oop/operator_methods/extended_parens.rb and its output."
---

`tests/_examples/oop/operator_methods/extended_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/operator_methods/extended_parens.rb){target=_blank rel=noopener}.

```metorex
class Value
  def initialize(v)
    @v = v
  end

  def <=>(other)
    @v <=> other.val()
  end

  def <<(other)
    Value.new(@v * 2 + other.val())
  end

  def val
    @v
  end

  def to_s
    @v.to_s
  end
end

a = Value.new(3)
b = Value.new(5)

puts a <=> b
puts b <=> a
puts a <=> a

e = a << b
puts e
```

Output:

```
-1
1
0
11
```
