---
title: "globals/parenless_method.rb"
slug: globals-parenless-method
description: "The metorex example program globals/parenless_method.rb and its output."
---

`tests/_examples/globals/parenless_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/parenless_method.rb).

```metorex
a = [1, 2]
a.push 3
a.unshift 0
puts a.length
puts a[0]
puts a[3]
```

Output:

```
4
0
3
```
