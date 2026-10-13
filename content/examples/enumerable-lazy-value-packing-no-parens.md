---
title: "enumerable/lazy_value_packing_no_parens.rb"
slug: enumerable-lazy-value-packing-no-parens
description: "The metorex example program enumerable/lazy_value_packing_no_parens.rb and its output."
---

`tests/_examples/enumerable/lazy_value_packing_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/enumerable/lazy_value_packing_no_parens.rb).

```metorex
# A lazy step hands on what the source yields as one value: several values
# packed into an Array, and none as nil.
pairs = Enumerator.new { |yielder| yielder.yield 1, 2 }
empty = Enumerator.new { |yielder| yielder.yield }
[:select, :reject, :take_while, :uniq].each do |step|
  walked = []
  pairs.lazy.public_send(step) { step != :reject }.each { |*values| walked.push values }
  p [step, walked]
end
walked = []
empty.lazy.take(1).each { |*values| walked.push values }
p walked
walked = []
pairs.lazy.with_index.each { |*values| walked.push values }
p walked

# A lazy zip starts its other sources over each time it is walked.
zipped = (0..1).lazy.zip 2..3
p zipped.force
p zipped.force

# `produce` reports an endless size, or the size it was given.
endless = Enumerator.produce(0) { |count| count + 1 }
p endless.size
counted = Enumerator.produce(0, size: -> { 5 * 5 }) { |count| count + 1 }
p counted.size
sized = Enumerator.produce(0, size: 3) { |count| count + 1 }
p sized.take 2
begin
  Enumerator.produce(width: 1, depth: 2) {}
rescue ArgumentError => problem
  p problem.message
end
```

Output:

```
[:select, [[[1, 2]]]]
[:reject, [[[1, 2]]]]
[:take_while, [[[1, 2]]]]
[:uniq, [[[1, 2]]]]
[[nil]]
[[[[1, 2], 0]]]
[[0, 2], [1, 3]]
[[0, 2], [1, 3]]
Infinity
25
[0, 1]
"unknown keywords: :width, :depth"
```
