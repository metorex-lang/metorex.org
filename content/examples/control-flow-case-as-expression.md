---
title: "control_flow/case_as_expression.rb"
slug: control-flow-case-as-expression
description: "The metorex example program control_flow/case_as_expression.rb and its output."
---

`tests/_examples/control_flow/case_as_expression.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_as_expression.rb){target=_blank rel=noopener}.

```metorex
x = case 2
when 1 then "one"
when 2 then "two"
else "other"
end
puts x

y = case "hello"
when "hi" then 1
when "hello" then 2
end
puts y

result = case 99
when 1 then "one"
end
puts result.nil?

n = 3
sum = 1 + (case n
when 1 then 10
when 2 then 20
when 3 then 30
else 0
end)
puts sum
```

Output:

```
two
2
true
31
```
