---
title: "control_flow/unless_with_else.rb"
slug: control-flow-unless-with-else
description: "The metorex example program control_flow/unless_with_else.rb and its output."
---

`tests/_examples/control_flow/unless_with_else.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/unless_with_else.rb).

```metorex
# Unless with else clause
temperature = 25

unless temperature < 0
  puts "Temperature is not freezing"
else
  puts "Temperature is freezing"
end

unless temperature > 30
  puts "Temperature is comfortable"
else
  puts "Temperature is hot"
end
```
