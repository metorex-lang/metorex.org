---
title: "oop/undefined_instance_methods_parens.rb"
slug: oop-undefined-instance-methods-parens
description: "The metorex example program oop/undefined_instance_methods_parens.rb and its output."
---

`tests/_examples/oop/undefined_instance_methods_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/undefined_instance_methods_parens.rb).

```metorex
module Mixin
  def from_module
  end
end

class Parent
  def kept
  end

  def retired
  end

  undef_method(:retired)
end

class Child < Parent
  include(Mixin)

  def own
  end

  undef_method(:own, :kept, :from_module)
end

puts(Parent.undefined_instance_methods.inspect)
puts(Child.undefined_instance_methods.sort.inspect)
puts(Child.instance_methods(false).inspect)
puts(Child.new.respond_to?(:kept).inspect)
puts(Parent.new.kept.inspect)
```

Output:

```
[:retired]
[:from_module, :kept, :own]
[]
false
nil
```
