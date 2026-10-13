---
title: "data_structures/multiple_assignment.rb"
slug: data-structures-multiple-assignment
description: "The metorex example program data_structures/multiple_assignment.rb and its output."
---

`tests/_examples/data_structures/multiple_assignment.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/multiple_assignment.rb){target=_blank rel=noopener}.

```metorex
# Multiple assignment from array
a, b, c = [1, 2, 3]
puts a
puts b
puts c

# More targets than values
x, y, z = [10, 20]
puts x
puts y
puts z

# Single non-array value assigned to multiple targets
p, q, r = 42
puts p
puts q
puts r

# Multiple values on right side
d, e = 100, 200
puts d
puts e

# More targets than right-side values
f, g, h = 7, 8
puts f
puts g
puts h
```

Output:

```
1
2
3
10
20

42


100
200
7
8

```
