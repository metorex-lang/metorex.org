---
title: "methods/yield_in_default_value.rb"
slug: methods-yield-in-default-value
description: "The metorex example program methods/yield_in_default_value.rb and its output."
---

`tests/_examples/methods/yield_in_default_value.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/yield_in_default_value.rb).

```metorex
def each_doubled(transform = proc { |value| yield value * 2 })
  [1, 2, 3].map { |value| transform.call(value) }
end

p each_doubled { |value| value + 1 }
p each_doubled(proc { |value| value })

def first_given(value = yield)
  value
end

p first_given { :from_the_block }
p first_given(:passed)

def block_from_default(given = block_given?, &block)
  given
end

p block_from_default {}
p block_from_default
```

Output:

```
[3, 5, 7]
[1, 2, 3]
:from_the_block
:passed
true
false
```
