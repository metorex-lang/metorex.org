---
title: "introspection/function/module.rb"
slug: introspection-function-module
description: "The metorex example program introspection/function/module.rb and its output."
---

`tests/_examples/introspection/function/module.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/function/module.rb).

```metorex
def greet(name)
  "Hello, " + name
end

def calculate(x, y)
  x + y
end

puts method(:greet).owner
puts method(:calculate).owner
```

Output:

```
Object
Object
```
