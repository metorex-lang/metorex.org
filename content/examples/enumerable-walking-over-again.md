---
title: "enumerable/walking_over_again.rb"
slug: enumerable-walking-over-again
description: "The metorex example program enumerable/walking_over_again.rb and its output."
---

`tests/_examples/enumerable/walking_over_again.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/walking_over_again.rb){target=_blank rel=noopener}.

```metorex
# `cycle` walks the elements over and over. A count says how many rounds,
# and the first round hands out the elements as it reads them.
seen = []
[1, 2, 3].cycle(2) { |element| seen.push(element) }
p seen

stopped = []
[10, 20, 30].cycle do |element|
  stopped.push(element)
  break if element == 20
end
p stopped

p [1, 2, 3, 4].cycle(2).size
p [1, 2].cycle.size
p [1, 2, 3].cycle(0) { |element| raise "never" }
```

Output:

```
[1, 2, 3, 1, 2, 3]
[10, 20]
8
Infinity
nil
```
