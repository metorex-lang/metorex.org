---
title: "errors/name_and_method_messages_no_parens.rb"
slug: errors-name-and-method-messages-no-parens
description: "The metorex example program errors/name_and_method_messages_no_parens.rb and its output."
---

`tests/_examples/errors/name_and_method_messages_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/name_and_method_messages_no_parens.rb).

```metorex
# What Ruby says of a name nothing defines, and of a method a receiver has
# none of. A class with no name of its own is written the way it writes
# itself, and one that answers `name` is named by that.
begin
  not_defined_anywhere
rescue NameError => raised
  puts raised.message
end

begin
  NotDefinedAnywhere
rescue NameError => raised
  puts raised.message
end

named = Class.new do
  def self.name
    "Named"
  end
end

begin
  named.missing
rescue NoMethodError => raised
  puts raised.message
end

begin
  named.new.missing
rescue NoMethodError => raised
  puts raised.message
end

held = Object.new
def held.only_this
end

begin
  held.missing
rescue NoMethodError => raised
  puts raised.message.sub(/0x\h+/, "0xADDRESS")
end
```

Output:

```
undefined local variable or method 'not_defined_anywhere' for main
uninitialized constant NotDefinedAnywhere
undefined method 'missing' for class Named
undefined method 'missing' for an instance of Named
undefined method 'missing' for #<Object:0xADDRESS>
```
