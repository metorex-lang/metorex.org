---
title: "algorithms/filter_even_numbers.rb"
slug: algorithms-filter-even-numbers
description: "The metorex example program algorithms/filter_even_numbers.rb and its output."
---

`tests/_examples/algorithms/filter_even_numbers.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/filter_even_numbers.rb){target=_blank rel=noopener}.

```metorex
numbers = [1, 2, 3, 4, 5, 6]
evens = numbers.select { |value| value % 2 == 0 }

puts evens
```

Output:

```
2
4
6
```
