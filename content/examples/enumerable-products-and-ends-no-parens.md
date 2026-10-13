---
title: "enumerable/products_and_ends_no_parens.rb"
slug: enumerable-products-and-ends-no-parens
description: "The metorex example program enumerable/products_and_ends_no_parens.rb and its output."
---

`tests/_examples/enumerable/products_and_ends_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/products_and_ends_no_parens.rb).

```metorex
# Every combination of several walks, the two ends of a range at once, and a
# walk with no end zipped against one that has a length.
walk = Enumerator.product 1..2, ["a", "b"]
p walk.class
p walk.to_a
p walk.size

endless = Enumerator.product 1.., ["x"]
p endless.first 3

p (3..9).minmax
p (9..3).minmax
p (1..4).minmax { |left, right| right <=> left }

p [1, 2].zip(10.upto(Float::INFINITY))
p 10.upto(Float::INFINITY).first 3

p [[:a, 1], [:b, 2]].to_h
begin
  [:a].to_h
rescue TypeError => refused
  p refused.message
end

p [7, 6, 5, 4].slice_before { |value| value.even? }.to_a

letters = %w[a b c]
p letters.each.with_index(1.9).to_a
```

Output:

```
Enumerator::Product
[[1, "a"], [1, "b"], [2, "a"], [2, "b"]]
4
[[1, "x"], [2, "x"], [3, "x"]]
[3, 9]
[nil, nil]
[4, 1]
[[1, 10], [2, 11]]
[10, 11, 12]
{a: 1, b: 2}
"wrong element type Symbol at 0 (expected array)"
[[7], [6, 5], [4]]
[["a", 1], ["b", 2], ["c", 3]]
```
