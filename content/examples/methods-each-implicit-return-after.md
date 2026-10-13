---
title: "methods/each/implicit_return_after.rb"
slug: methods-each-implicit-return-after
description: "The metorex example program methods/each/implicit_return_after.rb and its output."
---

`tests/_examples/methods/each/implicit_return_after.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/each/implicit_return_after.rb).

```metorex
def files(patterns)
  list = []
  patterns.each do |pattern|
    list += [pattern]
  end
  list
end

out = files(["a", "b"])
puts out.length
```
