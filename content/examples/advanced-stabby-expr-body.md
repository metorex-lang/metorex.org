---
title: "advanced/stabby_expr_body.rb"
slug: advanced-stabby-expr-body
description: "The metorex example program advanced/stabby_expr_body.rb and its output."
---

`tests/_examples/advanced/stabby_expr_body.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/stabby_expr_body.rb).

```metorex
# A stabby lambda whose body is one expression in braces
f = ->(x) { x + 1 }
puts f.call(4)
```

Output:

```
5
```
