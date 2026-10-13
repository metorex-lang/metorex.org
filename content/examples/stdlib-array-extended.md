---
title: "stdlib/array/extended.rb"
slug: stdlib-array-extended
description: "The metorex example program stdlib/array/extended.rb and its output."
---

`tests/_examples/stdlib/array/extended.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/array/extended.rb){target=_blank rel=noopener}.

```metorex
a = [1, 2, 3, 4, 5]
puts(a.inject(0) { |sum, x| sum + x })
puts(a.inject(10) { |sum, x| sum + x })

b = a.dup
b << 6
puts(a.length)
puts(b.length)

puts([1, nil, 2, nil, 3].compact)
puts([1, [2, 3], [4, [5]]].flatten)
puts([3, 1, 2, 1, 3].uniq)
puts([5, 2, 8, 1].min)
puts([5, 2, 8, 1].max)
puts([].empty?)
puts([1].empty?)
puts([10, 20, 30].first)
puts([10, 20, 30].last)
puts([1, 2, 3].include?(2))
puts([1, 2, 3].include?(9))
```

Output:

```
15
25
5
6
1
2
3
1
2
3
4
5
3
1
2
1
8
true
false
10
30
true
false
```
