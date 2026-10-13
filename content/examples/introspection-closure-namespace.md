---
title: "introspection/closure_namespace.rb"
slug: introspection-closure-namespace
description: "The metorex example program introspection/closure_namespace.rb and its output."
---

`tests/_examples/introspection/closure_namespace.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/closure_namespace.rb){target=_blank rel=noopener}.

```metorex
def simple_func
  1
end

puts method(:simple_func).name
puts method(:simple_func).name
puts nil

def outer(x)
  y = 10

  inner = lambda do |z|
    x + y + z
  end

  puts inner.class.name
  puts inner.class.name
  puts inner.binding.class

  inner.call(5)
end

result = outer(3)
puts result
```

Output:

```
simple_func
simple_func

Proc
Proc
Binding
18
```
