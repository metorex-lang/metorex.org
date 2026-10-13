---
title: "callables/yield_alias_parens.rb"
slug: callables-yield-alias-parens
description: "The metorex example program callables/yield_alias_parens.rb and its output."
---

`tests/_examples/callables/yield_alias_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/yield_alias_parens.rb).

```metorex
# `Proc#yield` calls the proc the way `call` and `[]` do, taking the same
# arguments and the same block.
doubler = proc { |number| number * 2 }
p(doubler.yield(4))
p(doubler.call(4))
p(doubler[4])

strict = lambda { |first, second| first - second }
p(strict.yield(9, 4))

with_block = proc { |&given| given.call(7) }
p(with_block.yield { |number| number + 1 })
```

Output:

```
8
8
8
5
8
```
