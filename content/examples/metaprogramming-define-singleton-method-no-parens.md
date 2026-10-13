---
title: "metaprogramming/define_singleton_method_no_parens.rb"
slug: metaprogramming-define-singleton-method-no-parens
description: "The metorex example program metaprogramming/define_singleton_method_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/define_singleton_method_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_singleton_method_no_parens.rb).

```metorex
mod = Module.new do
  define_singleton_method :a do
    42
  end
end

puts mod.a

obj = Object.new
obj.define_singleton_method :shout do
  "hey"
end

puts obj.shout
```

Output:

```
42
hey
```
