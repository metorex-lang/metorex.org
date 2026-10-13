---
title: "stdlib/array/arrays.rb"
slug: stdlib-array-arrays
description: "The metorex example program stdlib/array/arrays.rb and its output."
---

`tests/_examples/stdlib/array/arrays.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/array/arrays.rb).

```metorex
arr = [3, 1, 4, 1, 5, 9, 2, 6]
puts arr.length
puts arr.size

arr2 = [1, 2, 3]
arr2.push(4)
puts arr2

popped = arr2.pop
puts popped
puts arr2

arr3 = [1, 2, 3]
first = arr3.shift
puts first
puts arr3

arr3.unshift(0)
puts arr3

nums = [3, 1, 4, 1, 5, 9, 2, 6]
puts nums.sort

puts nums.reverse

doubled = [1, 2, 3].map { |n| n * 2 }
puts doubled

evens = [1, 2, 3, 4, 5, 6].select { |n| n % 2 == 0 }
puts evens

sum = [1, 2, 3, 4, 5].reduce(0) { |acc, n| acc + n }
puts sum

letters = ["a", "b", "c"]
puts letters.join(", ")
puts letters.join
```

Output:

```
8
8
1
2
3
4
4
1
2
3
1
2
3
0
2
3
1
1
2
3
4
5
6
9
6
2
9
5
1
4
1
3
2
4
6
2
4
6
15
a, b, c
abc
```
