---
title: "control_flow/logical_operators.rb"
slug: control-flow-logical-operators
description: "The metorex example program control_flow/logical_operators.rb and its output."
---

`tests/_examples/control_flow/logical_operators.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/logical_operators.rb).

```metorex
# Logical operators: && and ||
x = true
y = false

puts x && y
puts x || y
puts false && true
puts false || true

# Short-circuit: || returns right side when left is falsy
a = nil || 42
puts a

# Short-circuit: && returns left side when left is falsy
b = nil && 42
puts b

# Chaining
puts true && true && true
puts true && false && true
puts false || false || true
```

Output:

```
false
true
false
true
42

true
false
true
```
