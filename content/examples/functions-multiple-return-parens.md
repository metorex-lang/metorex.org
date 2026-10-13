---
title: "functions/multiple_return_parens.rb"
slug: functions-multiple-return-parens
description: "The metorex example program functions/multiple_return_parens.rb and its output."
---

`tests/_examples/functions/multiple_return_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/multiple_return_parens.rb){target=_blank rel=noopener}.

```metorex
def swap(a, b)
  return b, a
end

result = swap 1, 2
puts result[0]
puts result[1]

def triple
  return 10, 20, 30
end

r = triple()
puts r[0]
puts r[1]
puts r[2]
```

Output:

```
2
1
10
20
30
```
