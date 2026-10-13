---
title: "introspection/builtin_class_method/builtin_class_method_no_parens.rb"
slug: introspection-builtin-class-method-builtin-class-method-no-parens
description: "The metorex example program introspection/builtin_class_method/builtin_class_method_no_parens.rb and its output."
---

`tests/_examples/introspection/builtin_class_method/builtin_class_method_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/builtin_class_method/builtin_class_method_no_parens.rb){target=_blank rel=noopener}.

```metorex
a = [1, 2, 3]
puts a.class
puts "hello".class
puts 42.class
puts 3.14.class
puts true.class
puts nil.class
r = 1..5
puts r.class
h = {"a" => 1}
puts h.class
s = Set.new
puts s.class
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
