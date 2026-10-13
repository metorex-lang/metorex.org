---
title: "sets/grouping_and_flattening_no_parens.rb"
slug: sets-grouping-and-flattening-no-parens
description: "The metorex example program sets/grouping_and_flattening_no_parens.rb and its output."
---

`tests/_examples/sets/grouping_and_flattening_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/sets/grouping_and_flattening_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The ways a set can be cut into subsets, and the way it opens up the sets
# it holds. A hash answers a lambda that reads one key.
words = Set["one", "two", "three", "four", "five"]

p words.classify { |word| word.length }
p words.divide { |word| word.length }.map { |group| group.to_a.sort }.sort
p Set[1, 3, 4, 6].divide { |left, right| (left - right).abs == 1 }.map { |group| group.to_a.sort }.sort
p words.classify.class

nested = Set[1, 2, Set[3, Set[4, 5]], 6]
p nested.flatten.to_a.sort
p nested.flatten.equal? nested

flattening = Set[1, Set[2, 3]]
p flattening.flatten!.to_a.sort
p Set[1, 2].flatten!

reader = { a: 1, b: 2 }.to_proc
p reader.lambda?
p reader.arity
p reader.call :a
p [:a, :b].map(&reader)
```

Output:

```
{3 => Set["one", "two"], 5 => Set["three"], 4 => Set["four", "five"]}
[["five", "four"], ["one", "two"], ["three"]]
[[1], [3, 4], [6]]
Enumerator
[1, 2, 3, 4, 5, 6]
false
[1, 2, 3]
nil
true
1
1
[1, 2]
```
