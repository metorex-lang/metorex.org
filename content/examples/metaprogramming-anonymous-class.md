---
title: "metaprogramming/anonymous_class.rb"
slug: metaprogramming-anonymous-class
description: "The metorex example program metaprogramming/anonymous_class.rb and its output."
---

`tests/_examples/metaprogramming/anonymous_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/anonymous_class.rb){target=_blank rel=noopener}.

```metorex
cls = Class.new { def foo; 'foo'; end }
puts cls.new.foo

sub = Class.new(cls) { def baz; 'baz'; end }
obj = sub.new
puts obj.foo
puts obj.baz

m = Module.new { def bar; 'bar'; end }
puts m.class
```

Output:

```
foo
foo
baz
Module
```
