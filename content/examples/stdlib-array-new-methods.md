---
title: "stdlib/array/new_methods.rb"
slug: stdlib-array-new-methods
description: "The metorex example program stdlib/array/new_methods.rb and its output."
---

`tests/_examples/stdlib/array/new_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/array/new_methods.rb).

```metorex
# inject with initial value
a = [1, 2, 3, 4, 5]
puts(a.inject(0) { |sum, x| sum + x })
puts(a.inject(10) { |sum, x| sum + x })
puts(a.inject("") { |s, x| s + x.to_s })

# dup / clone
b = [10, 20, 30]
c = b.dup
c << 40
puts(b.length)
puts(c.length)
d = b.clone
puts(d.length)

# flatten
puts([1, [2, 3], [4]].flatten)

# compact
puts([1, nil, 2, nil, 3].compact)

# empty?
puts([].empty?)
puts([1].empty?)

# first / last
puts([10, 20, 30].first)
puts([10, 20, 30].last)
puts([].first)
puts([].last)

# include? / contains?
puts([1, 2, 3].include?(2))
puts([1, 2, 3].include?(9))
puts([1, 2, 3].contains?(1))

# min / max
puts([5, 2, 8, 1].min)
puts([5, 2, 8, 1].max)
puts([3.5, 1.2, 2.8].min)
puts([3.5, 1.2, 2.8].max)
puts([].min)
puts([].max)

# uniq
puts([3, 1, 2, 1, 3].uniq)
```

Output:

```
15
25
12345
3
4
3
1
2
3
4
1
2
3
true
false
10
30


true
false
true
1
8
1.2
3.5


3
1
2
```
