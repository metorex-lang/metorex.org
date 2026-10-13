---
title: "metaprogramming/kernel_method_objects_no_parens.rb"
slug: metaprogramming-kernel-method-objects-no-parens
description: "The metorex example program metaprogramming/kernel_method_objects_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/kernel_method_objects_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/kernel_method_objects_no_parens.rb).

```metorex
# The Kernel methods every object answers can be taken as Method objects in
# a module body, as the debug gem takes `singleton_class` and `class`.
module Ledger
  SINGLETON_CLASS = method(:singleton_class).unbind
  CLASS = method(:class).unbind
end

p Ledger::SINGLETON_CLASS
p Ledger::SINGLETON_CLASS.bind_call Ledger
p Ledger::CLASS.bind_call "rate"
p Object.new.method(:singleton_class).owner
p Ledger.method(:singleton_class).call
```

Output:

```
#<UnboundMethod: Kernel#singleton_class()>
#<Class:Ledger>
String
Kernel
#<Class:Ledger>
```
