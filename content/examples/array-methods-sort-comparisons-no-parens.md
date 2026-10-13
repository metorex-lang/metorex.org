---
title: "array_methods/sort_comparisons_no_parens.rb"
slug: array-methods-sort-comparisons-no-parens
description: "The metorex example program array_methods/sort_comparisons_no_parens.rb and its output."
---

`tests/_examples/array_methods/sort_comparisons_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/sort_comparisons_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Sorting asks for a number of comparisons that grows as n log n, so a
# thousand elements take about ten thousand rather than half a million.
numbers = (1..1000).to_a.shuffle(random: Random.new(7))

comparisons = 0
sorted = numbers.sort do |left, right|
  comparisons += 1
  left <=> right
end
p sorted == (1..1000).to_a
p comparisons < 20_000

keys = 0
by_key = numbers.sort_by { |number| keys += 1; -number }
p by_key.first(3)
p keys

words = %w[pear fig apple kiwi date]
p words.sort
p words.sort { |left, right| right <=> left }
p words.sort_by(&:size)
p [3, 1, 2].sort!
```

Output:

```
true
true
[1000, 999, 998]
1000
["apple", "date", "fig", "kiwi", "pear"]
["pear", "kiwi", "fig", "date", "apple"]
["fig", "pear", "kiwi", "date", "apple"]
[1, 2, 3]
```
