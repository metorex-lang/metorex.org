---
title: "functions/chained_defaults.rb"
slug: functions-chained-defaults
description: "The metorex example program functions/chained_defaults.rb and its output."
---

`tests/_examples/functions/chained_defaults.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/chained_defaults.rb).

```metorex
# One default may set several parameters at once, and a later parameter reads
# what an earlier one was given.
def shared(a = b = c = {})
  [a, b, c]
end

p shared
p shared 1

def widened(first = 2, second = first * 3)
  [first, second]
end

p widened
p widened 5
```

Output:

```
[{}, {}, {}]
[1, nil, nil]
[2, 6]
[5, 15]
```
