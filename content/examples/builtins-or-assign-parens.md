---
title: "builtins/or_assign_parens.rb"
slug: builtins-or-assign-parens
description: "The metorex example program builtins/or_assign_parens.rb and its output."
---

`tests/_examples/builtins/or_assign_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/or_assign_parens.rb).

```metorex
# ||=
x = nil
x ||= 42
puts x
x ||= 99
puts x

# &&=
y = true
y &&= false
puts y
z = false
z &&= true
puts z
w = "hello"
w &&= "world"
puts w
```

Output:

```
42
42
false
false
world
```
