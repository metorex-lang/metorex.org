---
title: "introspection/class_own_methods_no_parens.rb"
slug: introspection-class-own-methods-no-parens
description: "The metorex example program introspection/class_own_methods_no_parens.rb and its output."
---

`tests/_examples/introspection/class_own_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/class_own_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Every class answers the methods Class defines, which Class lists as its
# own, apart from the ones it inherits from Module.
names = %i[allocate superclass subclasses attached_object new]
p names.map { |name| Object.respond_to?(name) }
p names.map { |name| RubyVM::InstructionSequence.respond_to?(name) }
p names.map { |name| Comparable.respond_to?(name) }
p Class.instance_methods(false).sort
p Class.public_instance_methods(false).sort
p Class.private_instance_methods(false).sort
p Class.instance_methods.include?(:alias_method)
p Object.superclass
```

Output:

```
[true, true, true, true, true]
[true, true, true, true, true]
[false, false, false, false, false]
[:allocate, :attached_object, :new, :subclasses, :superclass]
[:allocate, :attached_object, :new, :subclasses, :superclass]
[:inherited, :initialize]
true
BasicObject
```
