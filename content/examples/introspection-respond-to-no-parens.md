---
title: "introspection/respond_to_no_parens.rb"
slug: introspection-respond-to-no-parens
description: "The metorex example program introspection/respond_to_no_parens.rb and its output."
---

`tests/_examples/introspection/respond_to_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/respond_to_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Vault
  def open_door
  end

  def hidden
  end
  private :hidden

  def guarded
  end
  protected :guarded
end

vault = Vault.new
puts vault.respond_to? :open_door
puts vault.respond_to? :hidden
puts vault.respond_to?(:hidden, true)
puts vault.respond_to? :guarded
puts vault.respond_to?(:guarded, true)
puts vault.respond_to? :nothing_here
puts vault.respond_to? "open_door"

class Sealed
  class << self
    private :new
  end
end

puts Sealed.respond_to? :new
puts Sealed.respond_to?(:new, false)
puts Sealed.respond_to?(:new, true)

begin
  Sealed.new
rescue NoMethodError => error
  puts "#{error.class}: #{error.message}"
end

puts Vault.respond_to? :new
puts Vault.respond_to? :instance_methods

class Named
  def to_str
    "open_door"
  end
end
puts vault.respond_to? Named.new

begin
  vault.respond_to? 42
rescue TypeError => error
  puts "#{error.class}: #{error.message}"
end
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
false
false
true
NoMethodError: private method 'new' called for class Sealed
true
true
true
TypeError: 42 is not a symbol nor a string
```
