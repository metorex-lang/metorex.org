---
title: "metaprogramming/define_singleton_method.rb"
slug: metaprogramming-define-singleton-method
description: "The metorex example program metaprogramming/define_singleton_method.rb and its output."
---

`tests/_examples/metaprogramming/define_singleton_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_singleton_method.rb){target=_blank rel=noopener}.

```metorex
mod = Module.new do
  define_singleton_method :a do
    42
  end
  define_singleton_method(:b, -> x { 2 * x })
end

puts mod.a
puts mod.b(10)

klass = Class.new do
  define_singleton_method(:build) { "built" }
end

puts klass.build

obj = Object.new
obj.define_singleton_method(:greet) { "hi" }
puts obj.greet
puts Object.new.respond_to?(:greet)
```

Output:

```
42
20
built
hi
false
```
