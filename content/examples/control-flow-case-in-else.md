---
title: "control_flow/case_in_else.rb"
slug: control-flow-case-in-else
description: "The metorex example program control_flow/case_in_else.rb and its output."
---

`tests/_examples/control_flow/case_in_else.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_in_else.rb).

```metorex
# case/in with else clause (no NoMatchingPatternError)
value = "not a number"

case value
in Integer => n
  puts n
else
  puts "no match"
end

case nil
in Integer
  puts "integer"
in String
  puts "string"
else
  puts "nil or other"
end
```

Output:

```
no match
nil or other
```
