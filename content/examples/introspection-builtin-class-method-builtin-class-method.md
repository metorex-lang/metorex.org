---
title: "introspection/builtin_class_method/builtin_class_method.rb"
slug: introspection-builtin-class-method-builtin-class-method
description: "The metorex example program introspection/builtin_class_method/builtin_class_method.rb and its output."
---

`tests/_examples/introspection/builtin_class_method/builtin_class_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/builtin_class_method/builtin_class_method.rb){target=_blank rel=noopener}.

```metorex
puts([1, 2, 3].class)
puts("hello".class)
puts(42.class)
puts(3.14.class)
puts(true.class)
puts(nil.class)
puts((1..5).class)
h = {"a" => 1}
puts(h.class)
puts(Set.new().class)
```

Output:

```
Array
String
Integer
Float
TrueClass
NilClass
Range
Hash
Set
```
