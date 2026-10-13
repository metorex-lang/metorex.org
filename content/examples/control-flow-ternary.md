---
title: "control_flow/ternary.rb"
slug: control-flow-ternary
description: "The metorex example program control_flow/ternary.rb and its output."
---

`tests/_examples/control_flow/ternary.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/ternary.rb).

```metorex
x = true ? "yes" : "no"
puts(x)

y = false ? "yes" : "no"
puts(y)

a = 10
result = a > 5 ? "big" : "small"
puts(result)

nested = true ? (false ? "a" : "b") : "c"
puts(nested)
```

Output:

```
yes
no
big
b
```
