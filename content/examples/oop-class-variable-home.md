---
title: "oop/class_variable_home.rb"
slug: oop-class-variable-home
description: "The metorex example program oop/class_variable_home.rb and its output."
---

`tests/_examples/oop/class_variable_home.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/class_variable_home.rb){target=_blank rel=noopener}.

```metorex
module Shared
  @@count = :module

  def count
    @@count
  end

  def count=(value)
    @@count = value
  end
end

class Parent
  @@held = :parent

  def held
    @@held
  end

  def held=(value)
    @@held = value
  end
end

class Child < Parent; end

class Holder
  extend Shared
end

puts(Holder.count.to_s)
Holder.count = :written
puts(Holder.count.to_s)

Child.new.held = :from_child
puts(Parent.new.held.to_s)

parent = Class.new
subclass = Class.new(parent)
subclass.class_variable_set(:@@shared, :subclass)
parent.class_variable_set(:@@shared, :parent)
begin
  subclass.class_variable_get(:@@shared)
rescue RuntimeError => error
  puts(error.message.include?("is overtaken by").to_s)
end

begin
  eval("@@nowhere")
rescue RuntimeError => error
  puts(error.message)
end
```

Output:

```
module
written
from_child
true
class variable access from toplevel
```
