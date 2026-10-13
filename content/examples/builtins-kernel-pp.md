---
title: "builtins/kernel_pp.rb"
slug: builtins-kernel-pp
description: "The metorex example program builtins/kernel_pp.rb and its output."
---

`tests/_examples/builtins/kernel_pp.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_pp.rb).

```metorex
pp [1, 2, 3]
pp({a: 1, "b" => 2})
pp "text"

returned = pp :symbol
puts returned.inspect

pair = pp 1, 2
puts pair.inspect

puts pp.inspect
puts Kernel.private_instance_methods.include? :pp
```

Output:

```
[1, 2, 3]
{a: 1, "b" => 2}
"text"
:symbol
:symbol
1
2
[1, 2]
nil
true
```
