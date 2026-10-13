---
title: "introspection/function/name.rb"
slug: introspection-function-name
description: "The metorex example program introspection/function/name.rb and its output."
---

`tests/_examples/introspection/function/name.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/function/name.rb){target=_blank rel=noopener}.

```metorex
def greet(name)
  "Hello, " + name
end

def calculate(x, y)
  x + y
end

puts method(:greet).name
puts method(:calculate).name
```

Output:

```
greet
calculate
```
