---
title: "stdlib/prime_generators_no_parens.rb"
slug: stdlib-prime-generators-no-parens
description: "The metorex example program stdlib/prime_generators_no_parens.rb and its output."
---

`tests/_examples/stdlib/prime_generators_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/prime_generators_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The primes come from a generator the caller may choose. Without a block a
# walk hands back its own generator, which steps on with `next` and starts
# over with `rewind`, apart from every other walk.
require "prime"

p (Prime.each 20).to_a
within = Prime.each 20 do |prime|
  prime
end
p within
p Prime.first 6

walk = Prime.each
p [walk.next, walk.next, walk.next]
walk.rewind
p walk.next
p Prime.each { |prime| break prime }

trial = Prime.each 30, Prime::TrialDivisionGenerator.new
p trial.to_a
p Prime::Generator23.new.first 8
p (Prime.each.with_index 1).first 3

p Prime.prime? 97
p Prime.prime? 91, Prime::TrialDivisionGenerator.new
p 360.prime_division
p Integer.from_prime_division [[2, 3], [3, 2], [5, 1]]
p Prime.include? 7
p [2, 3, 4].map(&:prime?)

class Counter
  def initialize
    @count = 0
  end

  def succ
    @count += 1
  end

  alias next succ
end
counter = Counter.new
p [counter.succ, counter.next]

root = Math.sqrt 30
p (2..root).to_a
p (2...4.0).map { |value| value * 10 }
```

Output:

```
[2, 3, 5, 7, 11, 13, 17, 19]
19
[2, 3, 5, 7, 11, 13]
[2, 3, 5]
2
2
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
[2, 3, 5, 7, 11, 13, 17, 19]
[[2, 1], [3, 2], [5, 3]]
true
false
[[2, 3], [3, 2], [5, 1]]
360
true
[true, true, false]
[1, 2]
[2, 3, 4, 5]
[20, 30]
```
