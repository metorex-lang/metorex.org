---
title: "enumerable/empty_cycles_no_parens.rb"
slug: enumerable-empty-cycles-no-parens
description: "The metorex example program enumerable/empty_cycles_no_parens.rb and its output."
---

`tests/_examples/enumerable/empty_cycles_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/empty_cycles_no_parens.rb).

```metorex
# Cycling over nothing has no elements to repeat, so its size is 0.
p [].cycle.size
p [].each_entry.cycle.size
p [1].cycle.size

# A generator yielding nothing packs that as nil.
generated = Enumerator.new do |yielder|
  yielder.yield
  yielder.yield 1, 2
end
p generated.to_a

# `uniq` on a cycle that stops keeps the first of each.
taken = [1, 2, 1].cycle.first 5
p taken.uniq
```

Output:

```
0
0
Infinity
[nil, [1, 2]]
[1, 2]
```
