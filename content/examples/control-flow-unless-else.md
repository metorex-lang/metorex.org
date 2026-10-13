---
title: "control_flow/unless_else.rb"
slug: control-flow-unless-else
description: "The metorex example program control_flow/unless_else.rb and its output."
---

`tests/_examples/control_flow/unless_else.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/unless_else.rb).

```metorex
x = 10
unless x > 20
  puts("not big")
else
  puts("big")
end

unless false
  puts("truthy path")
else
  puts("falsy path")
end
```

Output:

```
not big
truthy path
```
