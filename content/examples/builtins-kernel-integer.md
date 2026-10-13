---
title: "builtins/kernel_integer.rb"
slug: builtins-kernel-integer
description: "The metorex example program builtins/kernel_integer.rb and its output."
---

`tests/_examples/builtins/kernel_integer.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_integer.rb){target=_blank rel=noopener}.

```metorex
puts Integer(42)
puts Integer(3.99)
puts Integer(-3.99)
puts Integer("42")
puts Integer " 42 "
puts Integer("1_000")
puts Integer("+7")
puts Integer("-7")

puts Integer("0x1f")
puts Integer("0b1010")
puts Integer("0o17")
puts Integer("017")
puts Integer("0d99")

puts Integer("ff", 16)
puts Integer("1_1", 4)
puts Integer("ghj", 30)
puts Integer("100", 2)

puts Integer("abc", exception: false).inspect
puts Integer(nil, exception: false).inspect
puts Integer("0.0", exception: false).inspect

class Weight
  def to_int
    12
  end
end

puts Integer(Weight.new)

class Rough
  def to_i
    5
  end
end

puts Integer(Rough.new)

begin
  Integer("1__2")
rescue ArgumentError => e
  puts e.message
end

begin
  Integer(nil)
rescue TypeError => e
  puts e.message
end

begin
  Integer(98, 15)
rescue ArgumentError => e
  puts e.message
end

begin
  Integer(0 / 0.0)
rescue FloatDomainError => e
  puts e.message
end

puts Kernel.Integer("10")
puts Kernel.private_instance_methods.include?(:Integer)
```

Output:

```
42
3
-3
42
42
1000
7
-7
31
10
15
15
99
255
5
14929
4
nil
nil
nil
12
5
invalid value for Integer(): "1__2"
can't convert nil into Integer
base specified for non string value
NaN
10
true
```
