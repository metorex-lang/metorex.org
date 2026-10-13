---
title: "enumerable/lazy_enum_for_dispatch.rb"
slug: enumerable-lazy-enum-for-dispatch
description: "The metorex example program enumerable/lazy_enum_for_dispatch.rb and its output."
---

`tests/_examples/enumerable/lazy_enum_for_dispatch.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/lazy_enum_for_dispatch.rb){target=_blank rel=noopener}.

```metorex
class Enumerator::Lazy
  def doubled_pairs(offset)
    return to_enum(:doubled_pairs, offset) unless block_given?
    each { |value| yield value * 2, offset }
  end
end

numbers = (1..Float::INFINITY).lazy
paired = numbers.doubled_pairs(7)
puts paired.class
p paired.first(3)
p paired.map { |doubled, offset| doubled + offset }.first(2)

indexed = numbers.enum_for(:each_with_index)
puts indexed.class
p indexed.first(2)
p indexed.select { |value, index| index.even? }.first(2)

sized = numbers.enum_for(:each_slice, 3) { 99 }
puts sized.size
p sized.first(2)

(1..7).lazy.each_slice(3) { |slice| p slice }
(1..3).lazy.each_with_index { |value, index| p [value, index] }
```

Output:

```
Enumerator::Lazy
[[2, 7], [4, 7], [6, 7]]
[9, 11]
Enumerator::Lazy
[[1, 0], [2, 1]]
[[1, 0], [3, 2]]
99
[[1, 2, 3], [4, 5, 6]]
[1, 2, 3]
[4, 5, 6]
[7]
[1, 0]
[2, 1]
[3, 2]
```
