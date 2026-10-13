---
title: "metaprogramming/instance_exec/singleton_def_parens.rb"
slug: metaprogramming-instance-exec-singleton-def-parens
description: "The metorex example program metaprogramming/instance_exec/singleton_def_parens.rb and its output."
---

`tests/_examples/metaprogramming/instance_exec/singleton_def_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/instance_exec/singleton_def_parens.rb).

```metorex
# A `def` written at the top of an instance_exec block belongs to the receiver
# alone, so another instance of the same class does not answer it.
one = Object.new

one.instance_exec do
  def greeting
    "hello"
  end
end

puts(one.greeting)
puts(one.singleton_methods.inspect)
puts(Object.new.respond_to?(:greeting))

counter = Object.new
counter.instance_eval do
  def next_value
    @value = @value.to_i + 1
  end
end

puts(counter.next_value)
puts(counter.next_value)
```

Output:

```
hello
[:greeting]
false
1
2
```
