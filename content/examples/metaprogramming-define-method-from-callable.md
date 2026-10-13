---
title: "metaprogramming/define_method_from_callable.rb"
slug: metaprogramming-define-method-from-callable
description: "The metorex example program metaprogramming/define_method_from_callable.rb and its output."
---

`tests/_examples/metaprogramming/define_method_from_callable.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_method_from_callable.rb){target=_blank rel=noopener}.

```metorex
borrowed = Class.new do
  def test_method(first, second)
    [first, second]
  end
  define_method(:another_test_method, instance_method(:test_method))
end

puts borrowed.new.another_test_method(1, 2).inspect

parent = Class.new { define_method(:foo) { :bar } }
child = Class.new(parent) do
  define_method(:baz, parent.instance_method(:foo))
end
puts child.new.baz.inspect

helpers = Module.new do
  def from_module
    :module_method
  end
end
holder = Class.new do
  define_method(:borrowed, helpers.instance_method(:from_module))
end
puts holder.new.borrowed.inspect

adder = Class.new do
  define_method(:add, :+.to_proc)
end
puts adder.new.add(1, 2).inspect

returned = nil
Class.new do
  returned = define_method(:named) { :ok }
end
puts returned.inspect

visibility = Class.new do
  define_method(:public_one) { :public }
  private
  define_method(:private_one) { :private }
  define_method(:initialize) { @ready = true }
end
puts visibility.public_instance_methods(false).sort.inspect
puts visibility.private_instance_methods(false).sort.inspect

begin
  Class.new { define_method(:oops, "not callable") }
rescue TypeError => error
  puts error.message
end

begin
  Class.new do
    freeze
    define_method(:late) { :nope }
  end
rescue FrozenError
  puts "FrozenError"
end
```

Output:

```
[1, 2]
:bar
:module_method
3
:named
[:public_one]
[:initialize, :private_one]
wrong argument type String (expected Proc/Method/UnboundMethod)
FrozenError
```
