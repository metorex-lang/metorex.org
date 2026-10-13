---
title: "functions/closures_nested.rb"
slug: functions-closures-nested
description: "The metorex example program functions/closures_nested.rb and its output."
---

`tests/_examples/functions/closures_nested.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/closures_nested.rb).

```metorex
def make_multiplier(factor)
  lambda do |value|
    factor * value
  end
end

double = make_multiplier(2)
triple = make_multiplier(3)

puts double.call(5)
puts triple.call(4)
```

Output:

```
10
12
```
