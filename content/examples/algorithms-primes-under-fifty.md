---
title: "algorithms/primes_under_fifty.rb"
slug: algorithms-primes-under-fifty
description: "The metorex example program algorithms/primes_under_fifty.rb and its output."
---

`tests/_examples/algorithms/primes_under_fifty.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/primes_under_fifty.rb).

```metorex
limit = 50
primes = []

(2...limit).each do |candidate|
  is_prime = true
  primes.each do |prime|
    if candidate % prime == 0
      is_prime = false
      break
    end
  end
  if is_prime
    primes.push(candidate)
  end
end

puts primes
```

Output:

```
2
3
5
7
11
13
17
19
23
29
31
37
41
43
47
```
