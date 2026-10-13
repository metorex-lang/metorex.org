---
title: "functions/yield_block_given.rb"
slug: functions-yield-block-given
description: "The metorex example program functions/yield_block_given.rb and its output."
---

`tests/_examples/functions/yield_block_given.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/yield_block_given.rb).

```metorex
def maybe_yield(x)
  if block_given?
    yield x
  else
    puts("no block: " + x.to_s)
  end
end

maybe_yield(42) do |n|
  puts("got: " + n.to_s)
end

maybe_yield(99)
```

Output:

```
got: 42
no block: 99
```
