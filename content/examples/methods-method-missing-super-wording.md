---
title: "methods/method_missing_super_wording.rb"
slug: methods-method-missing-super-wording
description: "The metorex example program methods/method_missing_super_wording.rb and its output."
---

`tests/_examples/methods/method_missing_super_wording.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/method_missing_super_wording.rb).

```metorex
class Forwarder
  def method_missing(name, *arguments) = super
end

begin
  Forwarder.new.shipped(1)
rescue NoMethodError => error
  puts error.message
end

forwarder = Forwarder.new
def forwarder.tracked = true

begin
  forwarder.shipped(1)
rescue NoMethodError => error
  puts error.message.sub(/0x\h+/, "0x")
end
```

Output:

```
undefined method 'shipped' for an instance of Forwarder
undefined method 'shipped' for #<Forwarder:0x>
```
