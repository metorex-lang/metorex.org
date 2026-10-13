---
title: "control_flow/case_expr_inline.rb"
slug: control-flow-case-expr-inline
description: "The metorex example program control_flow/case_expr_inline.rb and its output."
---

`tests/_examples/control_flow/case_expr_inline.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_expr_inline.rb){target=_blank rel=noopener}.

```metorex
# Case expression with inline syntax (then keyword)

x = 2
result = case x when 1 then "one" when 2 then "two" when 3 then "three" else "other" end
puts result

# Case expression with patterns and inline syntax
value = 10
message = case value when 5 then "five" when 10 then "ten" when 15 then "fifteen" else "unknown" end
puts message

# Case expression in an assignment with no else
num = 1
output = case num when 1 then "first" when 2 then "second" end
puts output
```

Output:

```
two
ten
first
```
