---
title: "metaprogramming/class_variable_set_parens.rb"
slug: metaprogramming-class-variable-set-parens
description: "The metorex example program metaprogramming/class_variable_set_parens.rb and its output."
---

`tests/_examples/metaprogramming/class_variable_set_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_variable_set_parens.rb){target=_blank rel=noopener}.

```metorex
# Module#class_variable_set — written with parentheses. Sets a class
# variable by name, returns the assigned value, raises FrozenError when the
# receiver is frozen, and mixes in a duplicated module via `include(Mod.dup)`.
module Flags
  @@flag = :off
end

klass = Class.new { include(Flags.dup) }
puts(klass.class_variable_set("@@flag", :on))
puts(klass.class_variable_get(:@@flag))

other = Class.new
puts(other.class_variable_set(:@@count, 3))
puts(other.class_variable_get(:@@count))

begin
  Class.new.freeze.class_variable_set(:@@x, 1)
rescue FrozenError
  puts("frozen Class raises FrozenError")
end

begin
  Module.new.freeze.class_variable_set(:@@x, 1)
rescue FrozenError
  puts("frozen Module raises FrozenError")
end
```

Output:

```
on
on
3
3
frozen Class raises FrozenError
frozen Module raises FrozenError
```
