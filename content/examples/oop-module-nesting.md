---
title: "oop/module_nesting.rb"
slug: oop-module-nesting
description: "The metorex example program oop/module_nesting.rb and its output."
---

`tests/_examples/oop/module_nesting.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_nesting.rb){target=_blank rel=noopener}.

```metorex
module Outer
  module Inner
    @recorded = {}
    def self.[] name
      @recorded[name]
    end
    def self.[]= name, value
      @recorded[name] = value
    end

    Inner[:body] = Module.nesting

    class << self
      Inner[:singleton] = Module.nesting
    end

    class Nested
      Inner[:nested_class] = Module.nesting
    end

    def self.from_method
      Module.nesting
    end
  end

  Inner[:outer_body] = Module.nesting
end

Outer::Inner[:top_level] = Module.nesting

puts Outer::Inner[:top_level].inspect
puts Outer::Inner[:outer_body].inspect
puts Outer::Inner[:body].inspect
puts Outer::Inner[:nested_class].inspect
puts (Outer::Inner[:singleton] == [Outer::Inner.singleton_class, Outer::Inner, Outer]).inspect
puts Outer::Inner.from_method.inspect
```

Output:

```
[]
[Outer]
[Outer::Inner, Outer]
[Outer::Inner::Nested, Outer::Inner, Outer]
true
[Outer::Inner, Outer]
```
