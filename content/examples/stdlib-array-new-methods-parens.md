---
title: "stdlib/array/new_methods_parens.rb"
slug: stdlib-array-new-methods-parens
description: "The metorex example program stdlib/array/new_methods_parens.rb and its output."
---

`tests/_examples/stdlib/array/new_methods_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/array/new_methods_parens.rb).

```metorex
# inject with initial value
a = [1, 2, 3, 4, 5]
puts a.inject(0) { |sum, x| sum + x }
puts a.inject(10) { |sum, x| sum + x }

# dup / clone
b = [10, 20, 30]
c = b.dup
c << 40
puts b.length
puts c.length

# flatten
e = [1, [2, 3], [4]]
puts e.flatten

# compact
f = [1, nil, 2, nil, 3]
puts f.compact

# empty?
empty = []
puts empty.empty?
g = [1]
puts g.empty?

# first / last
h = [10, 20, 30]
puts h.first
puts h.last

# include?
puts h.include?(20)
puts h.include?(99)

# min / max
i = [5, 2, 8, 1]
puts i.min
puts i.max

# uniq
j = [3, 1, 2, 1, 3]
puts j.uniq
```

Output:

```
15
25
3
4
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
1
8
3
1
2
```
