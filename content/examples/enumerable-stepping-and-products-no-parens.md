---
title: "enumerable/stepping_and_products_no_parens.rb"
slug: enumerable-stepping-and-products-no-parens
description: "The metorex example program enumerable/stepping_and_products_no_parens.rb and its output."
---

`tests/_examples/enumerable/stepping_and_products_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/stepping_and_products_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A walk over evenly spaced numbers, and the Cartesian product of walks.

sequence = 1.step 10, 3
p sequence.class
p sequence.to_a
p [sequence.begin, sequence.end, sequence.step, sequence.exclude_end?]
p sequence.inspect
p sequence.size

seen = []
1.step 10, 4 do |value|
  seen.push value
end
p seen

whole = 1..10
open_ended = 1...10
p whole.step(3).to_a
p open_ended.step(4).last
p open_ended.step.size
p whole.step(3).inspect
p open_ended.step.exclude_end?
p 1.step(Float::INFINITY).size

every_other = whole % 2
p every_other.to_a
p every_other.inspect
p whole.step(100) == 1.step(10, 100)

product = Enumerator::Product.new [1, 2], [:a, :b]
p product.to_a
p product.size
p product.inspect
p product.each.size

pairs = []
product.each do |left, right|
  pairs.push [right, left]
end
p pairs

# A Yielder hands everything it is given to the block it was made with.
collected = []
yielder = Enumerator::Yielder.new do |*values|
  collected.push values
  "done"
end
p yielder.yield(1, 2)
yielder << 3
p collected
p yielder.to_proc.class

counted = Enumerator.new do |y|
  y << 1
  y.yield 2, 3
  y << [4]
end
p counted.to_a

begin
  Enumerator::ArithmeticSequence.new
rescue NoMethodError => error
  p error.class
end

begin
  Object.new.each_entry { }
rescue NoMethodError => error
  p error.message
end
```

Output:

```
Enumerator::ArithmeticSequence
[1, 4, 7, 10]
[1, 10, 3, false]
"(1.step(10, 3))"
4
[1, 5, 9]
[1, 4, 7, 10]
9
9
"((1..10).step(3))"
true
Infinity
[1, 3, 5, 7, 9]
"((1..10).%(2))"
true
[[1, :a], [1, :b], [2, :a], [2, :b]]
4
"#<Enumerator::Product: [[1, 2], [:a, :b]]>"
4
[[:a, 1], [:b, 1], [:a, 2], [:b, 2]]
"done"
[[1, 2], [3]]
Proc
[1, [2, 3], [4]]
NoMethodError
"undefined method 'each_entry' for an instance of Object"
```
