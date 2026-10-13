---
title: "symbols_and_ranges/reverse_walks_parens.rb"
slug: symbols-and-ranges-reverse-walks-parens
description: "The metorex example program symbols_and_ranges/reverse_walks_parens.rb and its output."
---

`tests/_examples/symbols_and_ranges/reverse_walks_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/reverse_walks_parens.rb){target=_blank rel=noopener}.

```metorex
# `reverse_each` walks a range from its end down to its beginning. A range
# counting integers can start past any beginning, and one walking with `succ`
# needs both ends.
collected = []
(1..3).reverse_each { |number| collected << number }
p collected

collected = []
(1...3).reverse_each { |number| collected << number }
p collected

p ("A".."D").reverse_each.to_a
p (:A..:D).reverse_each.to_a
p (..5).reverse_each.take(3)
p (1..3).reverse_each.size
p ("a".."z").reverse_each.size
p (..3).reverse_each.size

# A walk that cannot start names the value it would have started from.
begin
  (1..).reverse_each.take(3)
rescue TypeError => trouble
  p trouble.message
end

begin
  (1.1..3.3).reverse_each { |value| value }
rescue TypeError => trouble
  p trouble.message
end

# Two values with no order of their own are the same when `==` says so, which
# is what lets a range of them be built at all.
p(// <=> //)
p(// <=> /x/)
```

Output:

```
[3, 2, 1]
[2, 1]
["D", "C", "B", "A"]
[:D, :C, :B, :A]
[5, 4, 3]
3
nil
Infinity
"can't iterate from NilClass"
"can't iterate from Float"
0
nil
```
