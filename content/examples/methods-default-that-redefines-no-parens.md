---
title: "methods/default_that_redefines_no_parens.rb"
slug: methods-default-that-redefines-no-parens
description: "The metorex example program methods/default_that_redefines_no_parens.rb and its output."
---

`tests/_examples/methods/default_that_redefines_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/default_that_redefines_no_parens.rb).

```metorex
# A default value is evaluated each time the method is called without the
# argument, and it may define methods, including the one being called.
# Written with as few parentheses as Ruby allows.

class Greeter
  def greet(x = (def greet; "hello"; end; 1))
    x
  end
end

greeter = Greeter.new
p greeter.greet(42)
p greeter.greet
p greeter.greet

holder = Object.new
holder.instance_eval do
  def prepare(a = (def from_default; end))
    def from_body; end
  end
end
holder.prepare
p [holder.respond_to?(:from_default), holder.respond_to?(:from_body)]
p Object.new.respond_to?(:from_default)
```

Output:

```
42
1
"hello"
[true, true]
false
```
