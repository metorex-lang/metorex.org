---
title: "advanced/dynamic_method_definition.rb"
slug: advanced-dynamic-method-definition
description: "The metorex example program advanced/dynamic_method_definition.rb and its output."
---

`tests/_examples/advanced/dynamic_method_definition.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/dynamic_method_definition.rb).

```metorex
MyClass.define_method(:greet) do
  puts "Hello from dynamically defined method!"
end

source = MyClass.get_source(:greet)
puts source.statements
```
