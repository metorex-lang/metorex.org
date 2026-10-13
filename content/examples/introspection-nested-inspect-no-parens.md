---
title: "introspection/nested_inspect_no_parens.rb"
slug: introspection-nested-inspect-no-parens
description: "The metorex example program introspection/nested_inspect_no_parens.rb and its output."
---

`tests/_examples/introspection/nested_inspect_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/nested_inspect_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Address
  def initialize(city)
    @city = city
  end
end

class Customer
  def initialize(name, city)
    @name = name
    @address = Address.new(city)
    @self_reference = self
  end
end

class Forwarder < BasicObject
  def initialize(target)
    @target = target
  end

  def method_missing(name, *arguments)
    @target.__send__(name, *arguments)
  end
end

puts Customer.new("Ada", "Austin").inspect.gsub(/0x\h+/, "0x0")
p [Address.new("Boise")].inspect.gsub(/0x\h+/, "0x0")
p Forwarder.new([1, 2])
p [Forwarder.new(:on_ident)]
```

Output:

```
#<Customer:0x0 @name="Ada", @address=#<Address:0x0 @city="Austin">, @self_reference=#<Customer:0x0 ...>>
"[#<Address:0x0 @city=\"Boise\">]"
[1, 2]
[:on_ident]
```
