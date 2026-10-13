---
title: "control_flow/case_expr_block.rb"
slug: control-flow-case-expr-block
description: "The metorex example program control_flow/case_expr_block.rb and its output."
---

`tests/_examples/control_flow/case_expr_block.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_expr_block.rb).

```metorex
# Case expression with block syntax (multiline)

x = 2
result = case x
when 1
  "one"
when 2
  "two"
when 3
  "three"
else
  "other"
end
puts result

# Case expression with string matching
value = "hello"
output = case value
when "hello"
  "greeting"
when "goodbye"
  "farewell"
else
  "unknown"
end
puts output

# Case expression with type matching
num = -5
sign = case num
when Integer
  "it's an integer"
else
  "not an integer"
end
puts sign
```

Output:

```
two
greeting
it's an integer
```
