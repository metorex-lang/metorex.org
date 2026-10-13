---
title: "functions/locals_scope.rb"
slug: functions-locals-scope
description: "The metorex example program functions/locals_scope.rb and its output."
---

`tests/_examples/functions/locals_scope.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/locals_scope.rb){target=_blank rel=noopener}.

```metorex
total = -1
doubles = [1, 2, 3]

def stats(n)
  total = 0
  doubles = (0...n).map { |i| i * 2 }
  doubles.each do |value|
    total = total + value
  end
  puts total
  puts doubles
end

stats(5)
```

Output:

```
20
0
2
4
6
8
```
