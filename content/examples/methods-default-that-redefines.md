---
title: "methods/default_that_redefines.rb"
slug: methods-default-that-redefines
description: "The metorex example program methods/default_that_redefines.rb and its output."
---

`tests/_examples/methods/default_that_redefines.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/default_that_redefines.rb){target=_blank rel=noopener}.

```metorex
# A default value is evaluated each time the method is called without the
# argument, and it may define methods, including the one being called.

class Greeter
  def greet(x = (def greet; "hello"; end; 1))
    x
  end
end

greeter = Greeter.new
p(greeter.greet(42))
p(greeter.greet)
p(greeter.greet)

holder = Object.new
holder.instance_eval do
  def prepare(a = (def from_default; end))
    def from_body; end
  end
end
holder.prepare
p([holder.respond_to?(:from_default), holder.respond_to?(:from_body)])
p(Object.new.respond_to?(:from_default))
```

Output:

```
42
1
"hello"
[true, true]
false
```
