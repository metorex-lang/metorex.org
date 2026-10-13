---
title: "oop/singleton_class_kinds.rb"
slug: oop-singleton-class-kinds
description: "The metorex example program oop/singleton_class_kinds.rb and its output."
---

`tests/_examples/oop/singleton_class_kinds.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_class_kinds.rb).

```metorex
# An object's singleton class is a kind of its class's singleton class.
klass = Class.new
sub = Class.new(klass)
instance = klass.new
p(instance.singleton_class.superclass.equal?(klass))
p(instance.singleton_class.is_a?(klass.singleton_class))
p(sub.is_a?(klass.singleton_class))
p(sub.new.singleton_class.is_a?(klass.singleton_class))
p(klass.singleton_class.is_a?(klass.singleton_class))
```

Output:

```
true
true
true
true
false
```
