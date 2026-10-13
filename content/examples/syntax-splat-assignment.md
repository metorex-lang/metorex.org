---
title: "syntax/splat_assignment.rb"
slug: syntax-splat-assignment
description: "The metorex example program syntax/splat_assignment.rb and its output."
---

`tests/_examples/syntax/splat_assignment.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/splat_assignment.rb){target=_blank rel=noopener}.

```metorex
# A splat in a multiple assignment takes whatever the named targets leave.
first, *rest = [1, 2, 3]
p(first)
p(rest)

only, *nothing = [1]
p(only)
p(nothing)

*leading, last = [1, 2, 3]
p(leading)
p(last)

head, *middle, tail = [1, 2, 3, 4, 5]
p(head)
p(middle)
p(tail)

short, *gap, final = [1, 2]
p(short)
p(gap)
p(final)

*everything = [1, 2]
p(everything)

# A right side that is not an Array reaches the first target alone.
lone, *empty = 9
p(lone)
p(empty)

# Several values on the right are spread the same way.
one, *others = 1, 2, 3
p(one)
p(others)

name, *lines = "first\nsecond\nthird\n".lines.map { |line| line.chomp }
p(name)
p(lines)
```

Output:

```
1
[2, 3]
1
[]
[1, 2]
3
1
[2, 3, 4]
5
1
[]
2
[1, 2]
9
[]
1
[2, 3]
"first"
["second", "third"]
```
