---
title: "globals/modifier_test.rb"
slug: globals-modifier-test
description: "The metorex example program globals/modifier_test.rb and its output."
---

`tests/_examples/globals/modifier_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/modifier_test.rb).

```metorex
x = nil
x = 99 unless x
puts x
y = 0
y = 42 if true
puts y
z = 10
z = 0 if false
puts z
```

Output:

```
99
42
10
```
