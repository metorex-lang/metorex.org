---
title: "metaprogramming/caller_locations_slicing_parens.rb"
slug: metaprogramming-caller-locations-slicing-parens
description: "The metorex example program metaprogramming/caller_locations_slicing_parens.rb and its output."
---

`tests/_examples/metaprogramming/caller_locations_slicing_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/caller_locations_slicing_parens.rb).

```metorex
def innermost
  all = caller_locations(0)
  ranged = caller_locations(2..3)
  endless = caller_locations(2..)
  limited = caller_locations(1, 2)

  puts(all.length >= 3)
  puts(all[0].lineno == 2)
  puts(ranged.map(&:lineno) == all[2..3].map(&:lineno))
  puts(endless.map(&:lineno) == all[2..-1].map(&:lineno))
  puts(limited.length == 2)
  puts(caller_locations(100).inspect)
  puts(caller_locations(all.length).inspect)
  puts(all[0].class)
  puts(all[0].path == __FILE__)
  puts(all[0].absolute_path == File.expand_path(__FILE__))
end

def middle
  innermost
end

def outermost
  middle
end

outermost
puts(Kernel.private_instance_methods.include?(:caller_locations))
```

Output:

```
true
true
true
true
true
nil
[]
Thread::Backtrace::Location
true
true
true
```
