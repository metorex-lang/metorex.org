---
title: "control_flow/case_wildcard.rb"
slug: control-flow-case-wildcard
description: "The metorex example program control_flow/case_wildcard.rb and its output."
---

`tests/_examples/control_flow/case_wildcard.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_wildcard.rb){target=_blank rel=noopener}.

```metorex
# Case statement with wildcard pattern
value = 42

case value
  when 1
    puts "one"
  when 2
    puts "two"
  when _
    puts "many"
end
```
