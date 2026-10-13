---
title: "procs/primitive_singleton_methods_no_parens.rb"
slug: procs-primitive-singleton-methods-no-parens
description: "The metorex example program procs/primitive_singleton_methods_no_parens.rb and its output."
---

`tests/_examples/procs/primitive_singleton_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/primitive_singleton_methods_no_parens.rb).

```metorex
# A singleton method belongs to the one Proc, Method, or Binding it is
# defined on.
first = proc { 1 }
second = proc { 2 }
def first.label = "first"
p first.label
p second.respond_to? :label
p first.singleton_methods

taken = 1.method :succ
def taken.label = "succ"
p taken.label

held = binding
def held.label = "binding"
p held.label
```

Output:

```
"first"
false
[:label]
"succ"
"binding"
```
