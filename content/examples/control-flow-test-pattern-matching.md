---
title: "control_flow/test_pattern_matching.rb"
slug: control-flow-test-pattern-matching
description: "The metorex example program control_flow/test_pattern_matching.rb and its output."
---

`tests/_examples/control_flow/test_pattern_matching.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/test_pattern_matching.rb){target=_blank rel=noopener}.

```metorex
# Pattern matching tests
x = 2
case x
when 1
  puts "one"
when 2
  puts "two"
when 3
  puts "three"
end

action = "stop"
case action
when "start"
  puts "starting"
when "stop"
  puts "stopping"
when "restart"
  puts "restarting"
end

num = 42
case num
when 1
  puts "one"
when 2
  puts "two"
else
  puts "other number"
end

val = 1.0
case val
when 1.0
  puts "one point zero"
when 2.0
  puts "two point zero"
end

n = 5
case n
when _
  puts "five"
end
```

Output:

```
two
stopping
other number
one point zero
five
```
