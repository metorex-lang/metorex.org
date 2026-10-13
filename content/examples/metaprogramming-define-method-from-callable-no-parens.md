---
title: "metaprogramming/define_method_from_callable_no_parens.rb"
slug: metaprogramming-define-method-from-callable-no-parens
description: "The metorex example program metaprogramming/define_method_from_callable_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/define_method_from_callable_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_method_from_callable_no_parens.rb).

```metorex
borrowed = Class.new do
  def test_method first, second
    [first, second]
  end
  define_method :another_test_method, instance_method(:test_method)
end

puts borrowed.new.another_test_method(1, 2).inspect

parent = Class.new { define_method(:foo) { :bar } }
child = Class.new parent do
  define_method :baz, parent.instance_method(:foo)
end
puts child.new.baz.inspect

helpers = Module.new do
  def from_module
    :module_method
  end
end
holder = Class.new do
  define_method :borrowed, helpers.instance_method(:from_module)
end
puts holder.new.borrowed.inspect

adder = Class.new do
  define_method :add, :+.to_proc
end
puts adder.new.add(1, 2).inspect

returned = nil
Class.new do
  returned = define_method :named do
    :ok
  end
end
puts returned.inspect
```

Output:

```
[1, 2]
:bar
:module_method
3
:named
```
