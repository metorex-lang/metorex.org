---
title: "metaprogramming/bound_kernel_method.rb"
slug: metaprogramming-bound-kernel-method
description: "The metorex example program metaprogramming/bound_kernel_method.rb and its output."
---

`tests/_examples/metaprogramming/bound_kernel_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/bound_kernel_method.rb).

```metorex
class Ledger
  def record(entry, amount = 0) = [entry, amount]
  def method(*) = "a method of its own"
end

ledger = Ledger.new
bound = Kernel.instance_method(:method).bind(ledger)
recorded = bound.call(:record)
p recorded.class
p recorded.arity
p recorded.call("rent", 5)
p ledger.method(:record)
p Kernel.instance_method(:method).bind_call(ledger, :record).name
```

Output:

```
Method
-2
["rent", 5]
"a method of its own"
:record
```
