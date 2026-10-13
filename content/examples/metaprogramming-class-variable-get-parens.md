---
title: "metaprogramming/class_variable_get_parens.rb"
slug: metaprogramming-class-variable-get-parens
description: "The metorex example program metaprogramming/class_variable_get_parens.rb and its output."
---

`tests/_examples/metaprogramming/class_variable_get_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_variable_get_parens.rb){target=_blank rel=noopener}.

```metorex
# Module#class_variable_get — written with parentheses. Reads a class
# variable by name, walking included modules and superclasses, and raises a
# NameError when the variable is not defined.
module Trackable
  @@tracked = :yes
end

class Counter
  @@count = 7
end

class Widget < Counter
  include Trackable
end

puts(Counter.class_variable_get(:@@count))
puts(Counter.class_variable_get("@@count"))
puts(Widget.class_variable_get(:@@tracked))
puts(Widget.class_variable_get(:@@count))

c = Class.new
c.class_variable_set(:@@local, "here")
puts(c.class_variable_get(:@@local))

begin
  c.class_variable_get(:@@missing)
rescue NameError
  puts("missing raises NameError")
end
```

Output:

```
7
7
yes
7
here
missing raises NameError
```
