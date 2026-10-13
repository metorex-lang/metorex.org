---
title: "metaprogramming/class_variables.rb"
slug: metaprogramming-class-variables
description: "The metorex example program metaprogramming/class_variables.rb and its output."
---

`tests/_examples/metaprogramming/class_variables.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_variables.rb).

```metorex
# Module#class_variables — written without parentheses. Returns class
# variable names as symbols in definition order. The optional `inherit`
# argument controls whether class variables from ancestors are included.
class Base
  @@base = 1
  @@shared = 2
end

class Derived < Base
  @@derived = 3
end

puts Base.class_variables.inspect
puts Derived.class_variables.inspect

own = Derived.class_variables false
puts own.inspect

module Flags
  @@flag = :on
end

puts Flags.class_variables.inspect
```

Output:

```
[:@@base, :@@shared]
[:@@derived, :@@base, :@@shared]
[:@@derived]
[:@@flag]
```
