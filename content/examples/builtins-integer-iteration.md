---
title: "builtins/integer_iteration.rb"
slug: builtins-integer-iteration
description: "The metorex example program builtins/integer_iteration.rb and its output."
---

`tests/_examples/builtins/integer_iteration.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/integer_iteration.rb).

```metorex
1.upto(3) do |n|
  puts n
end

3.downto 1 do |n|
  puts n
end

puts 1.upto(3).to_a.inspect
puts 3.downto(1).to_a.inspect

half = 3.quo(2)
puts half.to_s
puts half.to_i
puts half.to_f
puts half.numerator
puts half.denominator
puts Rational(8, 3).to_i
puts 4.quo(2).to_s
```

Output:

```
1
2
3
3
2
1
[1, 2, 3]
[3, 2, 1]
3/2
1
1.5
3
2
2
2/1
```
