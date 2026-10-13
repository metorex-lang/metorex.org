---
title: "oop/comparable/singleton_class_expr.rb"
slug: oop-comparable-singleton-class-expr
description: "The metorex example program oop/comparable/singleton_class_expr.rb and its output."
---

`tests/_examples/oop/comparable/singleton_class_expr.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/comparable/singleton_class_expr.rb){target=_blank rel=noopener}.

```metorex
a = Class.new
singleton_class = (class << a; self; end)
puts singleton_class.attached_object == a
```

Output:

```
true
```
