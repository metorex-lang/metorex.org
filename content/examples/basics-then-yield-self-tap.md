---
title: "basics/then_yield_self_tap.rb"
slug: basics-then-yield-self-tap
description: "The metorex example program basics/then_yield_self_tap.rb and its output."
---

`tests/_examples/basics/then_yield_self_tap.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/then_yield_self_tap.rb){target=_blank rel=noopener}.

```metorex
puts 5.then { |n| n + 1 }
puts 5.yield_self { |n| n * 2 }
puts 5.tap { |n| puts n }

puts "value".then { |text| text.upcase }

numbers = [1, 2, 3]
puts numbers.yield_self { |list| list.length }

puts 7.then { 42 }
```

Output:

```
6
10
5
5
VALUE
3
42
```
