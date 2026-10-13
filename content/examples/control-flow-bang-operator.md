---
title: "control_flow/bang_operator.rb"
slug: control-flow-bang-operator
description: "The metorex example program control_flow/bang_operator.rb and its output."
---

`tests/_examples/control_flow/bang_operator.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/bang_operator.rb).

```metorex
# Bang (!) unary not operator
x = true
y = false

puts !x
puts !y
puts !nil
puts !!true
puts !false || true
```

Output:

```
false
true
true
true
true
```
