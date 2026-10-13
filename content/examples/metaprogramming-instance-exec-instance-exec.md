---
title: "metaprogramming/instance_exec/instance_exec.rb"
slug: metaprogramming-instance-exec-instance-exec
description: "The metorex example program metaprogramming/instance_exec/instance_exec.rb and its output."
---

`tests/_examples/metaprogramming/instance_exec/instance_exec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/instance_exec/instance_exec.rb).

```metorex
# instance_exec example
class Box
  def initialize(val)
    @value = val
  end

  def value
    @value
  end

  def transform(&blk)
    instance_exec(&blk)
  end

  def doubled
    instance_exec do
      @value * 2
    end
  end
end

b = Box.new 5
puts b.doubled

b2 = Box.new 10
puts b2.doubled

puts b.transform { @value + 100 }
```

Output:

```
10
20
105
```
