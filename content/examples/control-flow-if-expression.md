---
title: "control_flow/if_expression.rb"
slug: control-flow-if-expression
description: "The metorex example program control_flow/if_expression.rb and its output."
---

`tests/_examples/control_flow/if_expression.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/if_expression.rb).

```metorex
# if/unless as expressions (assign result of if...end)
x = if true then 42 else 0 end
puts x

y = if false then 1 else 2 end
puts y

z = if nil then 1 end
puts z

w = unless false then 10 else 20 end
puts w

result = if 1 > 0
  "positive"
elsif 1 < 0
  "negative"
else
  "zero"
end
puts result
```

Output:

```
42
2

10
positive
```
