---
title: "metaprogramming/bytecode_define_method.rb"
slug: metaprogramming-bytecode-define-method
description: "The metorex example program metaprogramming/bytecode_define_method.rb and its output."
---

`tests/_examples/metaprogramming/bytecode_define_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/bytecode_define_method.rb).

```metorex
# Example: define_method for runtime method definition
#
# define_method allows creating methods dynamically at runtime.

class Greeter
  define_method(:hello, lambda do |name|
    "Hello, " + name
  end)
end

g = Greeter.new
puts g.hello("World")
```
