---
title: "stdlib/numbers/numbers.rb"
slug: stdlib-numbers-numbers
description: "The metorex example program stdlib/numbers/numbers.rb and its output."
---

`tests/_examples/stdlib/numbers/numbers.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/numbers/numbers.rb){target=_blank rel=noopener}.

```metorex
# Numeric methods demonstration

# Integer methods
puts 42.abs
x = -7
puts x.abs

puts 42.to_f
puts 42.to_s
puts 42.to_i

# Integer#times
sum = 0
5.times do |i|
  sum += i
end
puts sum

# Float methods
puts 3.14.abs
y = -2.5
puts y.abs

puts 3.7.ceil
puts 3.2.floor
puts 3.14159.round(2)

puts 3.7.to_i
puts 3.14.to_f
puts 3.14.to_s
```

Output:

```
42
7
42.0
42
42
10
3.14
2.5
4
3
3.14
3
3.14
3.14
```
