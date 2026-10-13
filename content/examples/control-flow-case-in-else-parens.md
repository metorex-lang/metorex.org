---
title: "control_flow/case_in_else_parens.rb"
slug: control-flow-case-in-else-parens
description: "The metorex example program control_flow/case_in_else_parens.rb and its output."
---

`tests/_examples/control_flow/case_in_else_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_in_else_parens.rb).

```metorex
# case/in with else clause (no NoMatchingPatternError), with parentheses
value = "not a number"

case value
in Integer => n
  puts(n)
else
  puts("no match")
end

case nil
in Integer
  puts("integer")
in String
  puts("string")
else
  puts("nil or other")
end
```

Output:

```
no match
nil or other
```
