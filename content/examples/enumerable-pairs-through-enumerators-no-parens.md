---
title: "enumerable/pairs_through_enumerators_no_parens.rb"
slug: enumerable-pairs-through-enumerators-no-parens
description: "The metorex example program enumerable/pairs_through_enumerators_no_parens.rb and its output."
---

`tests/_examples/enumerable/pairs_through_enumerators_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/pairs_through_enumerators_no_parens.rb).

```metorex
# An enumerator over pairs, such as `each_with_index` makes, yields each pair
# as two values: `map` and `each` spread them for the block, and `select`
# hands them over as one Array.
p [1, 2].each_with_index.map { |*pair| pair }
p [1, 2].each_with_index.map { |first| first }
p [1, 2].each_with_index.map { |item, index| item * index }
p [1, 2].each_with_index.select { |*packed| packed.size == 1 }
p [1, 2].each_with_index.select { |pair| pair[1] == 1 }
[1, 2].each_with_index.each { |*pair| p pair }
p [1, 2].each_with_object([]).map { |*pair| pair }
p [1, 2].each.with_index.map { |*pair| pair }
p [1, 2].each.with_index.select { |item, index| index.zero? }
begin
  [1, 2].each_with_index.map(&:to_s)
rescue ArgumentError => error
  p error.message
end
```

Output:

```
[[1, 0], [2, 1]]
[1, 2]
[0, 2]
[[1, 0], [2, 1]]
[[2, 1]]
[1, 0]
[2, 1]
[[1, []], [2, []]]
[[1, 0], [2, 1]]
[[1, 0]]
"invalid radix 0"
```
