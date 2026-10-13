---
title: "enumerable/empty_cycles.rb"
slug: enumerable-empty-cycles
description: "The metorex example program enumerable/empty_cycles.rb and its output."
---

`tests/_examples/enumerable/empty_cycles.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/empty_cycles.rb){target=_blank rel=noopener}.

```metorex
# Cycling over nothing has no elements to repeat, so its size is 0.
p [].cycle.size
p [].each_entry.cycle.size
p [1].cycle.size

# A generator yielding nothing packs that as nil.
generated = Enumerator.new { |yielder| yielder.yield; yielder.yield(1, 2) }
p generated.to_a

# `uniq` on a cycle that stops keeps the first of each.
p [1, 2, 1].cycle.first(5).uniq
```

Output:

```
0
0
Infinity
[nil, [1, 2]]
[1, 2]
```
