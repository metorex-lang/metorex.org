---
title: "control_flow/case_in_basic.rb"
slug: control-flow-case-in-basic
description: "The metorex example program control_flow/case_in_basic.rb and its output."
---

`tests/_examples/control_flow/case_in_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_in_basic.rb).

```metorex
# case/in pattern matching (Ruby 2.7+ style)
value = 42

case value
in Integer => n
  puts n
end

x = "hello"

case x
in String => s
  puts s
in Integer
  puts "number"
end

case [1, 2, 3]
in [Integer => a, Integer => b, Integer => c]
  puts a
  puts b
  puts c
end

case 99
in 99 => n
  puts n
end
```

Output:

```
42
hello
1
2
3
99
```
