---
title: "control_flow/unless_else_parens.rb"
slug: control-flow-unless-else-parens
description: "The metorex example program control_flow/unless_else_parens.rb and its output."
---

`tests/_examples/control_flow/unless_else_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/unless_else_parens.rb).

```metorex
x = 10
unless x > 20
  puts "not big"
else
  puts "big"
end

unless false
  puts "truthy path"
else
  puts "falsy path"
end
```

Output:

```
not big
truthy path
```
