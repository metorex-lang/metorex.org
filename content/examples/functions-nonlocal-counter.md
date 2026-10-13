---
title: "functions/nonlocal_counter.rb"
slug: functions-nonlocal-counter
description: "The metorex example program functions/nonlocal_counter.rb and its output."
---

`tests/_examples/functions/nonlocal_counter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/nonlocal_counter.rb).

```metorex
def make_counter
  count = 0

  increment = lambda do
    count = count + 1
    puts count
  end

  get_count = lambda do
    puts count
  end

  reset = lambda do
    count = 0
  end

  increment.call
  increment.call
  increment.call
  get_count.call
  reset.call
  get_count.call
  increment.call
end

make_counter
```

Output:

```
1
2
3
3
0
1
```
