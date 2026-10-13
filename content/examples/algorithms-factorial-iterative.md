---
title: "algorithms/factorial_iterative.rb"
slug: algorithms-factorial-iterative
description: "The metorex example program algorithms/factorial_iterative.rb and its output."
---

`tests/_examples/algorithms/factorial_iterative.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/factorial_iterative.rb).

```metorex
n = 6
result = 1

(2..n).each do |value|
  result *= value
end

puts result
```

Output:

```
720
```
