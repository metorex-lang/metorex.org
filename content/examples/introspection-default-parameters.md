---
title: "introspection/default_parameters.rb"
slug: introspection-default-parameters
description: "The metorex example program introspection/default_parameters.rb and its output."
---

`tests/_examples/introspection/default_parameters.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/default_parameters.rb){target=_blank rel=noopener}.

```metorex
def no_defaults(a, b)
  a + b
end

def with_defaults(a, b=10, c=20)
  a + b + c
end

def all_defaults(x=1, y=2, z=3)
  x + y + z
end

def greet(name, greeting="Hello", punctuation="!")
  greeting + " " + name + punctuation
end

p method(:no_defaults).name
p method(:no_defaults).parameters

p method(:with_defaults).name
p method(:with_defaults).parameters

p method(:all_defaults).name
p method(:all_defaults).parameters

p method(:greet).name
p method(:greet).parameters
```

Output:

```
:no_defaults
[[:req, :a], [:req, :b]]
:with_defaults
[[:req, :a], [:opt, :b], [:opt, :c]]
:all_defaults
[[:opt, :x], [:opt, :y], [:opt, :z]]
:greet
[[:req, :name], [:opt, :greeting], [:opt, :punctuation]]
```
