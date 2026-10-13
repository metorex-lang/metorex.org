---
title: "metaprogramming/block_param_defaults.rb"
slug: metaprogramming-block-param-defaults
description: "The metorex example program metaprogramming/block_param_defaults.rb and its output."
---

`tests/_examples/metaprogramming/block_param_defaults.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/block_param_defaults.rb){target=_blank rel=noopener}.

```metorex
# Block parameter defaults — written without parentheses where possible.
# `{ |a, b = 1| }` binds b to 1 when only one argument is supplied, both
# in direct block calls and in methods created via define_method. A
# trailing comma in the parameter list parses (`|a,|`).
pair = lambda { |a, b = 1| [a, b] }
puts pair.call(5).inspect
puts pair.call(5, 6).inspect

klass = Class.new do
  define_method(:m) { |a, b = 1| return a, b }
end
puts klass.new.m(1).inspect
puts klass.new.m(1, 2).inspect

begin
  klass.new.m
rescue ArgumentError
  puts "ArgumentError"
end

begin
  klass.new.m(1, 2, 3)
rescue ArgumentError
  puts "ArgumentError"
end

first_only = lambda { |a,| a }
puts first_only.call(9).inspect
```

Output:

```
[5, 1]
[5, 6]
[1, 1]
[1, 2]
ArgumentError
ArgumentError
9
```
