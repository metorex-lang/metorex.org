---
title: "oop/undef_method_parens.rb"
slug: oop-undef-method-parens
description: "The metorex example program oop/undef_method_parens.rb and its output."
---

`tests/_examples/oop/undef_method_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/undef_method_parens.rb).

```metorex
class Parent
  def inherited_method
    :parent
  end
end

class Child < Parent
  def own
    :own
  end
end

puts(Child.send(:undef_method, :own, :inherited_method).inspect)
puts(Child.new.respond_to?(:own).inspect)
puts(Parent.new.inherited_method.inspect)

begin
  Child.send(:undef_method, :never_defined)
rescue NameError => error
  puts(error.message)
end

begin
  String.singleton_class.send(:undef_method, :not_exist)
rescue NameError => error
  puts(error.message)
end

puts(Child.send(:undef_method).inspect)

frozen = Module.new do
  def doomed
  end
end
frozen.freeze

begin
  frozen.send(:undef_method, :doomed)
rescue FrozenError
  puts "frozen: FrozenError"
end

target = "World"
pattern = /Hello #{target}/
puts(pattern.inspect)
puts((pattern === "Hello World").inspect)
puts(Regexp.escape("a.b*c").inspect)
```

Output:

```
Child
false
:parent
undefined method 'never_defined' for class 'Child'
undefined method 'not_exist' for class 'String'
Child
frozen: FrozenError
/Hello World/
true
"a\\.b\\*c"
```
