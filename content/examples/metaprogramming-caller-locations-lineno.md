---
title: "metaprogramming/caller_locations_lineno.rb"
slug: metaprogramming-caller-locations-lineno
description: "The metorex example program metaprogramming/caller_locations_lineno.rb and its output."
---

`tests/_examples/metaprogramming/caller_locations_lineno.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/caller_locations_lineno.rb).

```metorex
# Kernel#caller_locations — written without parentheses where possible.
# Inside a const_added hook, level 1 is the site of the constant
# definition, including lines inside a module_eval string with an explicit
# lineno. Also checks that tokens after a heredoc opener keep the opener's
# line number.
$lines = []

mod = Module.new do
  def self.const_added name
    locs = caller_locations 1, 1
    $lines << locs[0].lineno
  end
end

line = __LINE__
mod.module_eval(<<-RUBY, __FILE__, __LINE__ + 1)
  TEST = 1

  module SubModule
  end
RUBY

mod.const_set :CONST_SET, 1

puts $lines == [line + 2, line + 4, line + 8]
puts __LINE__ == line + 11
```

Output:

```
true
true
```
