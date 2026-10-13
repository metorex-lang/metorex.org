---
title: "functions/double_splat_params.rb"
slug: functions-double-splat-params
description: "The metorex example program functions/double_splat_params.rb and its output."
---

`tests/_examples/functions/double_splat_params.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/double_splat_params.rb){target=_blank rel=noopener}.

```metorex
def collect(a, **rest)
  [a, rest.size, rest[:b], rest[:c]]
end

puts collect(1).inspect
puts collect(1, b: 2, c: 3).inspect

def mixed(a, b: 5, **rest)
  [a, b, rest.size, rest[:c]]
end

puts mixed(1, b: 2, c: 3).inspect
puts mixed(1, c: 3).inspect

def anonymous(a, **)
  a
end

puts anonymous(1, b: 2).inspect

def parenless a, **rest
  [a, rest.size]
end

puts parenless(1, b: 2).inspect
```

Output:

```
[1, 0, nil, nil]
[1, 2, 2, 3]
[1, 2, 1, 3]
[1, 5, 1, 3]
1
[1, 1]
```
