---
title: "control_flow/bang_operator_parens.rb"
slug: control-flow-bang-operator-parens
description: "The metorex example program control_flow/bang_operator_parens.rb and its output."
---

`tests/_examples/control_flow/bang_operator_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/bang_operator_parens.rb){target=_blank rel=noopener}.

```metorex
# Bang (!) unary not operator (with parentheses)
x = true
y = false

puts(!x)
puts(!y)
puts(!nil)
puts(!!true)
puts(!false || true)
```

Output:

```
false
true
true
true
true
```
