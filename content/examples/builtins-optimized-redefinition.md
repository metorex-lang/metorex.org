---
title: "builtins/optimized_redefinition.rb"
slug: builtins-optimized-redefinition
description: "The metorex example program builtins/optimized_redefinition.rb and its output."
---

`tests/_examples/builtins/optimized_redefinition.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/optimized_redefinition.rb).

```metorex
# A core method the interpreter answers without a dispatch says so when it is
# replaced, and an UnboundMethod cut from it before the change still runs the
# arithmetic underneath.
module Warning
  def warn(message, category: nil)
    print "[#{category}] #{message.split(': warning: ').last}"
    nil
  end
end

Warning[:performance] = true

original = Integer.instance_method :+

class Integer
  def +(other)
    :replaced
  end
end

puts 1 + 2
puts original.bind(1).call(2)

Warning[:performance] = false

class Integer
  def -(other)
    :quiet
  end
end

puts 5 - 1

srand 0x12345678901234567890
puts srand
```

Output:

```
[performance] Redefining 'Integer#+' disables interpreter and JIT optimizations
replaced
3
quiet
85968058271978839505040
```
