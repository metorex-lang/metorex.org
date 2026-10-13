---
title: "site/language_blocks.rb"
slug: site-language-blocks
description: "The metorex example program site/language_blocks.rb and its output."
---

`tests/_examples/site/language_blocks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_blocks.rb){target=_blank rel=noopener}.

```metorex
def each_pair_of(items)
  return enum_for(:each_pair_of, items) unless block_given?

  items.each_cons(2) { |first, second| yield first, second }
end

each_pair_of([1, 4, 9]) { |a, b| puts "#{a} -> #{b}" }
p each_pair_of(%w[a b c]).to_a

square = ->(n) { n * n }
add_one = proc { |n| n + 1 }
p [1, 2, 3].map(&square)
p (square >> add_one).call(4)
p %w[apple banana].map(&:upcase)
```

Output:

```
1 -> 4
4 -> 9
[["a", "b"], ["b", "c"]]
[1, 4, 9]
17
["APPLE", "BANANA"]
```
