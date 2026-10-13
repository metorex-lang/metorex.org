---
title: "introspection/public_methods_no_parens.rb"
slug: introspection-public-methods-no-parens
description: "The metorex example program introspection/public_methods_no_parens.rb and its output."
---

`tests/_examples/introspection/public_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/public_methods_no_parens.rb).

```metorex
module Helpers
  def mixed_in_open
  end
end

class Parent
  def parent_open
  end

  def parent_shut
  end
  private :parent_shut

  def self.parent_class_open
  end
end

class Child < Parent
  include Helpers

  def child_open
  end

  def child_guarded
  end
  protected :child_guarded

  def self.child_class_open
  end
end

def opens names
  names.select { |name| name.to_s.include?("open") }.sort
end

child = Child.new
puts opens(child.public_methods(false)).inspect
puts opens(child.public_methods).inspect
puts opens(Child.public_methods(false)).inspect
puts opens(child.public_methods(nil)).inspect
puts child.public_methods.include? :child_guarded
puts child.public_methods.include? :parent_shut

quotient = 13.divmod 4
puts quotient.inspect
negative_divisor = 13.divmod(-4)
puts negative_divisor.inspect
minus = -13
negative_value = minus.divmod 4
puts negative_value.inspect
puts 1.public_methods.include? :divmod

begin
  1.divmod 0
rescue ZeroDivisionError => error
  puts "#{error.class}: #{error.message}"
end
```

Output:

```
[:child_open]
[:child_open, :mixed_in_open, :parent_open]
[:child_class_open, :parent_class_open]
[:child_open]
false
false
[3, 1]
[-4, -3]
[-4, 3]
true
ZeroDivisionError: divided by 0
```
