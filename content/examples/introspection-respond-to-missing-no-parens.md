---
title: "introspection/respond_to_missing_no_parens.rb"
slug: introspection-respond-to-missing-no-parens
description: "The metorex example program introspection/respond_to_missing_no_parens.rb and its output."
---

`tests/_examples/introspection/respond_to_missing_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/respond_to_missing_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Ghost
  def respond_to_missing?(name, include_private = false)
    return true if name == :publicly_handled
    include_private && name == :privately_handled
  end

  def method_missing(name, *args)
    "called #{name}"
  end
end

ghost = Ghost.new
puts ghost.respond_to? :publicly_handled
puts ghost.respond_to? :privately_handled
puts ghost.respond_to?(:privately_handled, true)
puts ghost.respond_to? :not_handled

class Plain
  def visible
  end

  def hidden
  end
  private :hidden
end

plain = Plain.new
puts plain.respond_to? :visible
puts plain.respond_to? :hidden
puts plain.respond_to?(:hidden, true)
puts plain.respond_to?(:respond_to_missing?, true)
puts plain.send(:respond_to_missing?, :anything, true)

puts Plain.respond_to?(:respond_to_missing?, true)

class Registry
  def self.respond_to_missing?(name, include_private = false)
    name == :lookup
  end
end
puts Registry.respond_to? :lookup
puts Registry.respond_to? :missing_entirely

puts Kernel.private_instance_methods(false).include? :respond_to_missing?
puts Kernel.method(:respond_to_missing?).owner == Kernel
```

Output:

```
true
false
true
false
true
false
true
true
false
true
true
false
true
true
```
