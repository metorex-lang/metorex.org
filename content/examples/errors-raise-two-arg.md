---
title: "errors/raise_two_arg.rb"
slug: errors-raise-two-arg
description: "The metorex example program errors/raise_two_arg.rb and its output."
---

`tests/_examples/errors/raise_two_arg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/raise_two_arg.rb).

```metorex
begin
  raise RuntimeError, "custom message"
rescue
  puts("caught two-arg raise")
end
```

Output:

```
caught two-arg raise
```
