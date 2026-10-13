---
title: "control_flow/case_expression_basic.rb"
slug: control-flow-case-expression-basic
description: "The metorex example program control_flow/case_expression_basic.rb and its output."
---

`tests/_examples/control_flow/case_expression_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_expression_basic.rb){target=_blank rel=noopener}.

```metorex
# Basic case expression examples

# Simple literal matching with assignment
x = 2
result = case x
when 1 then "one"
when 2 then "two"
when 3 then "three"
else "other"
end
puts result

# Case expression as method argument
value = 42
puts(case value
when 42 then "The answer!"
when 0 then "Zero"
else "Unknown"
end)

# Case expression with no else returns nil
num = 99
output = case num
when 1 then "one"
when 2 then "two"
end
puts output

# Nested case expressions
a = 1
b = 2
result = case a
when 1 then case b
  when 2 then "a=1, b=2"
  else "a=1, b!=2"
  end
when 2 then "a=2"
else "other"
end
puts result
```

Output:

```
two
The answer!

a=1, b=2
```
