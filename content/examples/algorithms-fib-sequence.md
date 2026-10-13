---
title: "algorithms/fib_sequence.rb"
slug: algorithms-fib-sequence
description: "The metorex example program algorithms/fib_sequence.rb and its output."
---

`tests/_examples/algorithms/fib_sequence.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/fib_sequence.rb).

```metorex
count = 8
numbers = [0, 1]

while numbers.length < count
  numbers.push(numbers[-1] + numbers[-2])
end

puts numbers[0...count]
```
