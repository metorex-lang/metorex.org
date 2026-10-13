---
title: "stdlib/array/functional_parens.rb"
slug: stdlib-array-functional-parens
description: "The metorex example program stdlib/array/functional_parens.rb and its output."
---

`tests/_examples/stdlib/array/functional_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/array/functional_parens.rb).

```metorex
# Array functional methods with parens: any?, all?, none?, select, partition, inject/reduce
arr = [1, 2, 3, 4, 5]

puts(arr.any? { |x| x > 4 })
puts(arr.any? { |x| x > 10 })
puts(arr.all? { |x| x > 0 })
puts(arr.all? { |x| x > 3 })
puts(arr.none? { |x| x > 10 })
puts(arr.none? { |x| x > 3 })

evens = arr.select { |x| x % 2 == 0 }
puts(evens.length)
evens.each { |x| puts(x) }

parts = arr.partition { |x| x % 2 == 0 }
puts(parts[0].length)
puts(parts[1].length)

sum = arr.inject(0) { |acc, x| acc + x }
puts(sum)

product = arr.reduce(1) { |acc, x| acc * x }
puts(product)
```

Output:

```
true
false
true
false
true
false
2
2
4
2
3
15
120
```
