---
title: "oop/unbound_method.rb"
slug: oop-unbound-method
description: "The metorex example program oop/unbound_method.rb and its output."
---

`tests/_examples/oop/unbound_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/unbound_method.rb).

```metorex
module Greeter
  def greet
    :from_module
  end
end

class Base
  def label
    :from_base
  end
end

class Child < Base
  include Greeter
end

from_module = Child.instance_method(:greet)
from_super = Child.instance_method(:label)

puts from_module.bind(Child.new).call.inspect
puts from_super.bind(Child.new).call.inspect
puts Child.new.method(:label).call.inspect
puts Module.new.method(:instance_method).arity.inspect

begin
  Object.instance_method(:missing)
rescue NameError => error
  puts error.name.inspect
end

begin
  Object.instance_method(42)
rescue TypeError => error
  puts error.message
end

undefined_in_child = Class.new(Base)
undefined_in_child.send :undef_method, :label
begin
  undefined_in_child.instance_method(:label)
rescue NameError => error
  puts error.name.inspect
end
```

Output:

```
:from_module
:from_base
:from_base
1
:missing
42 is not a symbol nor a string
:label
```
