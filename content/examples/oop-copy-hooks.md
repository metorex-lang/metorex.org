---
title: "oop/copy_hooks.rb"
slug: oop-copy-hooks
description: "The metorex example program oop/copy_hooks.rb and its output."
---

`tests/_examples/oop/copy_hooks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/copy_hooks.rb).

```metorex
class Tracker
  attr_reader :log

  def initialize
    @log = []
  end

  def initialize_copy(source)
    @log = source.log + ["copied"]
  end
end

original = Tracker.new
puts original.dup.log.inspect

plain = Object.new
puts plain.send(:initialize_copy, plain).equal?(plain)
puts plain.send(:initialize_clone, Object.new).equal?(plain)
puts plain.send(:initialize_dup, Object.new).equal?(plain)

begin
  Object.new.freeze.send(:initialize_copy, Object.new)
rescue FrozenError => error
  puts error.class
end

begin
  1.send(:initialize_copy, Object.new)
rescue FrozenError => error
  puts error.class
end

class Parent
end

class Child < Parent
end

begin
  Parent.new.send(:initialize_copy, Child.new)
rescue TypeError => error
  puts error.message
end

puts Kernel.private_instance_methods.include?(:initialize_copy)
```

Output:

```
["copied"]
true
true
true
FrozenError
FrozenError
initialize_copy should take same class object
true
```
