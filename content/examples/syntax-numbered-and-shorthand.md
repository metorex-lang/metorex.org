---
title: "syntax/numbered_and_shorthand.rb"
slug: syntax-numbered-and-shorthand
description: "The metorex example program syntax/numbered_and_shorthand.rb and its output."
---

`tests/_examples/syntax/numbered_and_shorthand.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/numbered_and_shorthand.rb){target=_blank rel=noopener}.

```metorex
# A block that names no parameters reads what it was handed as `_1` and `_2`,
# and a call written `m(a:)` passes what `a` names under that keyword.
doubled = [1, 2, 3].map { _1 * 2 }
p(doubled)

pairs = [[1, 10], [2, 20]].map { _1 }
p(pairs)

def totals(first:, second:)
  [first, second, first + second]
end

first = 4
second = 6
p(totals(first:, second:))
p(totals(first: 1, second:))

gathered = { first:, second: }
p(gathered)
```

Output:

```
[2, 4, 6]
[[1, 10], [2, 20]]
[4, 6, 10]
[1, 6, 7]
{first: 4, second: 6}
```
