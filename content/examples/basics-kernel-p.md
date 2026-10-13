---
title: "basics/kernel_p.rb"
slug: basics-kernel-p
description: "The metorex example program basics/kernel_p.rb and its output."
---

`tests/_examples/basics/kernel_p.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/kernel_p.rb).

```metorex
p "abcde"
p 42
p :symbol
p nil
p [1, :two, "three"]

class Widget
  def inspect
    "custom inspect"
  end
end

p Widget.new

one = p 7
puts one.inspect

several = p 1, 2
puts several.inspect

none = p
puts none.inspect

puts Kernel.private_instance_methods(false).include?(:p)
```

Output:

```
"abcde"
42
:symbol
nil
[1, :two, "three"]
custom inspect
7
7
1
2
[1, 2]
nil
true
```
