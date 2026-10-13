---
title: "control_flow/case_guard.rb"
slug: control-flow-case-guard
description: "The metorex example program control_flow/case_guard.rb and its output."
---

`tests/_examples/control_flow/case_guard.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_guard.rb).

```metorex
# Guard clauses in case/when statements
# Demonstrates using conditionals with case statements

temperature = 75
if temperature > 80
  puts "Hot!"
elsif temperature > 60
  puts "Warm"
elsif temperature > 40
  puts "Cool"
else
  puts "Cold!"
end

# Another example
value = 100
if value > 50
  puts "Large hundred"
else
  puts "Small hundred"
end
```

Output:

```
Warm
Large hundred
```
