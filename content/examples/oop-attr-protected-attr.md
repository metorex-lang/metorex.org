---
title: "oop/attr/protected_attr.rb"
slug: oop-attr-protected-attr
description: "The metorex example program oop/attr/protected_attr.rb and its output."
---

`tests/_examples/oop/attr/protected_attr.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/attr/protected_attr.rb).

```metorex
c = Class.new do
  protected
  attr_accessor :foo
end

obj = c.new
begin
  obj.foo
  puts "BUG: foo getter should have raised"
rescue NoMethodError => e
  puts "OK reader raised: #{e.message.sub(/0x\h+/, "0xADDRESS")}"
end

begin
  obj.foo = 1
  puts "BUG: foo setter should have raised"
rescue NoMethodError => e
  puts "OK writer raised: #{e.message.sub(/0x\h+/, "0xADDRESS")}"
end
```

Output:

```
OK reader raised: protected method 'foo' called for an instance of #<Class:0xADDRESS>
OK writer raised: protected method 'foo=' called for an instance of #<Class:0xADDRESS>
```
