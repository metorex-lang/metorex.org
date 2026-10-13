---
title: "builtins/kernel_array_parens.rb"
slug: builtins-kernel-array-parens
description: "The metorex example program builtins/kernel_array_parens.rb and its output."
---

`tests/_examples/builtins/kernel_array_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_array_parens.rb).

```metorex
p(Array(nil))
p(Array([1, 2]))
p(Array(3))
p(Array({a: 1}))

class Pair
  def to_ary
    [1, 2]
  end
end

p(Array(Pair.new))

class Listed
  def to_a
    [3, 4]
  end
end

p(Array(Listed.new))

class PrivatePair
  def to_ary
    [5, 6]
  end
  private :to_ary
end

p(Array(PrivatePair.new))

class NilAry
  def to_ary
    nil
  end

  def to_a
    [7, 8]
  end
end

p(Array(NilAry.new))

class BadAry
  def to_ary
    "not an array"
  end
end

begin
  Array(BadAry.new)
rescue TypeError => error
  puts(error.message)
end

class BadToA
  def to_a
    "not an array"
  end
end

begin
  Array(BadToA.new)
rescue TypeError => error
  puts(error.message)
end

puts(Kernel.private_instance_methods.include?(:Array))
```

Output:

```
[]
[1, 2]
[3]
[[:a, 1]]
[1, 2]
[3, 4]
[5, 6]
[7, 8]
can't convert BadAry to Array (BadAry#to_ary gives String)
can't convert BadToA to Array (BadToA#to_a gives String)
true
```
