---
title: "advanced/parenless_splat.rb"
slug: advanced-parenless-splat
description: "The metorex example program advanced/parenless_splat.rb and its output."
---

`tests/_examples/advanced/parenless_splat.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/parenless_splat.rb){target=_blank rel=noopener}.

```metorex
# Test paren-less call with splat as non-first arg
def collect(a, *rest)
  [a] + rest
end
arr = [2, 3, 4]
result = collect 1, *arr
puts result.length
puts result[0]
puts result[1]
```

Output:

```
4
1
2
```
