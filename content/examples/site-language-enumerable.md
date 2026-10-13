---
title: "site/language_enumerable.rb"
slug: site-language-enumerable
description: "The metorex example program site/language_enumerable.rb and its output."
---

`tests/_examples/site/language_enumerable.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_enumerable.rb){target=_blank rel=noopener}.

```metorex
orders = [
  { item: "keyboard", price: 85, quantity: 2 },
  { item: "monitor", price: 240, quantity: 1 },
  { item: "cable", price: 9, quantity: 6 },
]

p orders.sum { it[:price] * it[:quantity] }
p orders.max_by { it[:price] }[:item]
p orders.partition { it[:price] > 50 }.map(&:size)
p orders.group_by { it[:quantity] > 1 }.transform_values { |group| group.map { it[:item] } }
p (1..Float::INFINITY).lazy.select(&:even?).map { it * it }.first(3)
p %w[a b c].each_with_index.to_h
```

Output:

```
464
"monitor"
[2, 1]
{true => ["keyboard", "cable"], false => ["monitor"]}
[4, 16, 36]
{"a" => 0, "b" => 1, "c" => 2}
```
