---
title: "array_methods/sort_by_enumerator_no_parens.rb"
slug: array-methods-sort-by-enumerator-no-parens
description: "The metorex example program array_methods/sort_by_enumerator_no_parens.rb and its output."
---

`tests/_examples/array_methods/sort_by_enumerator_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/sort_by_enumerator_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Without a block, sort_by answers an Enumerator, so `with_index` can hand
# each element's place to the block that names the sort key.
rates = %w[north south east]
p rates.sort_by.class
p rates.sort_by.with_index { |rate, index| -index }
p({ south: 2, north: 1 }.sort_by.with_index { |(region, _), _index| region })
```

Output:

```
Enumerator
["east", "south", "north"]
[[:north, 1], [:south, 2]]
```
