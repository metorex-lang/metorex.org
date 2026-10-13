---
title: "oop/attr/mixed_args.rb"
slug: oop-attr-mixed-args
description: "The metorex example program oop/attr/mixed_args.rb and its output."
---

`tests/_examples/oop/attr/mixed_args.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/mixed_args.rb){target=_blank rel=noopener}.

```metorex
class Mixed
  attr_accessor :a, "b"

  def initialize
    @a = 1
    @b = 2
  end
end

m = Mixed.new
puts m.a
puts m.b

m.a = 10
m.b = 20
puts m.a
puts m.b

# Bare identifier (variable) — evaluated and coerced via to_str.
class FromVar
  name = "value"
  attr_reader name
end

fv = FromVar.new
fv.instance_variable_set(:@value, 42)
puts fv.value
```

Output:

```
1
2
10
20
42
```
