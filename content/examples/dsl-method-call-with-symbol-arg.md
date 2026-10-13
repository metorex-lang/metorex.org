---
title: "dsl/method_call_with_symbol_arg.rb"
slug: dsl-method-call-with-symbol-arg
description: "The metorex example program dsl/method_call_with_symbol_arg.rb and its output."
---

`tests/_examples/dsl/method_call_with_symbol_arg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/method_call_with_symbol_arg.rb).

```metorex
puts :boom
puts(:boom)

def have_method(name, include_super = true)
  "matcher for #{name.inspect}"
end

x = have_method(:boom)
puts x

y = have_method :boom
puts y
```

Output:

```
boom
boom
matcher for :boom
matcher for :boom
```
