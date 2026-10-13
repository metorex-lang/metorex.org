---
title: "methods/super_in_a_block_of_a_class_named_later.rb"
slug: methods-super-in-a-block-of-a-class-named-later
description: "The metorex example program methods/super_in_a_block_of_a_class_named_later.rb and its output."
---

`tests/_examples/methods/super_in_a_block_of_a_class_named_later.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/super_in_a_block_of_a_class_named_later.rb){target=_blank rel=noopener}.

```metorex
class Reentrant
  def synchronize
    yield
  end
end

module Definitions
  def value = :from_module
end

Outer = Class.new
Outer.send(:include, Definitions)
Outer.send(:define_method, :value) { Reentrant.new.synchronize { super(&nil) } }
Inner = Class.new(Outer)
Inner.send(:include, Module.new)

p Inner.new.value
```

Output:

```
:from_module
```
