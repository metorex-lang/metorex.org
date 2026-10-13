---
title: "oop/freeze_singleton_class.rb"
slug: oop-freeze-singleton-class
description: "The metorex example program oop/freeze_singleton_class.rb and its output."
---

`tests/_examples/oop/freeze_singleton_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/freeze_singleton_class.rb){target=_blank rel=noopener}.

```metorex
target = Object.new
singleton = target.singleton_class

puts singleton.frozen?
target.freeze
puts singleton.frozen?
puts target.frozen?

begin
  target.instance_variable_set(:@name, "set")
rescue RuntimeError => error
  puts error.class
end

puts Complex(1.3, 3.1).frozen?
puts Rational(1, 3).frozen?
puts 1.frozen?
puts 1.2.frozen?
puts :sym.frozen?
puts nil.frozen?

plain = Object.new
puts plain.frozen?
puts plain.freeze.equal?(plain)
puts plain.frozen?
```

Output:

```
false
true
true
FrozenError
true
true
true
true
true
true
false
true
true
```
