---
title: "metaprogramming/instance_eval_source/strings_parens.rb"
slug: metaprogramming-instance-eval-source-strings-parens
description: "The metorex example program metaprogramming/instance_eval_source/strings_parens.rb and its output."
---

`tests/_examples/metaprogramming/instance_eval_source/strings_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/instance_eval_source/strings_parens.rb).

```metorex
# `instance_eval` takes source as well as a block. Either runs with `self`
# bound to the receiver, so both see its instance variables.

class Holder
  def initialize
    @value = 42
  end
end

holder = Holder.new
puts(holder.instance_eval("@value").to_s)
puts(holder.instance_eval { @value }.to_s)

# The block form yields the receiver.
puts("hola".instance_eval { |received| received.upcase })

# The block form takes no arguments of its own, and the source form takes
# between one and three.
begin
  "hola".instance_eval(4, 5) { |a, b| a + b }
rescue ArgumentError => error
  puts(error.message)
end

begin
  "hola".instance_eval
rescue ArgumentError => error
  puts(error.message)
end

begin
  "hola".instance_eval("1 + 1", "some file", 0, "bogus")
rescue ArgumentError => error
  puts(error.message)
end
```

Output:

```
42
42
HOLA
wrong number of arguments (given 2, expected 0)
wrong number of arguments (given 0, expected 1..3)
wrong number of arguments (given 4, expected 1..3)
```
