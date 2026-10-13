---
title: "methods/each/only.rb"
slug: methods-each-only
description: "The metorex example program methods/each/only.rb and its output."
---

`tests/_examples/methods/each/only.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/each/only.rb).

```metorex
def test
  list = []
  [1].each do |x|
    list += [x]
  end
  list
end

out = test()
puts out.length
```
