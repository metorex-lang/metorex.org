---
title: "builtins/rational.rb"
slug: builtins-rational
description: "The metorex example program builtins/rational.rb and its output."
---

`tests/_examples/builtins/rational.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/rational.rb).

```metorex
half = Rational(1, 2)
puts half
puts half.numerator
puts half.denominator
puts Rational(2, 4)
puts Rational(-3, -5)
puts Rational(7)
puts Rational 3, 9

puts 1/2r
puts 5r
puts 1.5r
puts 1/2r + 1/3r
puts 1/2r * 2/3r
puts 1/2r - 1/4r
puts((1/2r) / (1/4r))
puts 1/2r < 2/3r
puts half.to_f
puts Rational(8, 3).to_i
puts half.inspect
puts Rational(1).frozen?

puts Rational(".52")
puts Rational(".52", ".6")
puts Rational("3/4")
puts "0.6".to_r
puts 3.to_r
puts 0.5.to_r
puts (Rational(1) == Rational(1, 1))
puts (Rational(1) == 1)
puts Rational(1).eql?(1)

begin
  Rational(1, 0)
rescue ZeroDivisionError => e
  puts e.message
end

begin
  Rational(nil)
rescue TypeError => e
  puts e.message
end

puts Rational("abc", exception: false).inspect
```

Output:

```
1/2
1
2
1/2
3/5
7/1
1/3
1/2
5/1
3/2
5/6
1/3
1/4
2/1
true
0.5
2
(1/2)
true
13/25
13/15
3/4
3/5
3/1
1/2
true
true
false
divided by 0
can't convert nil into Rational
nil
```
