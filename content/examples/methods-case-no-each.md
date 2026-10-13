---
title: "methods/case/no_each.rb"
slug: methods-case-no-each
description: "The metorex example program methods/case/no_each.rb and its output."
---

`tests/_examples/methods/case/no_each.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/case/no_each.rb).

```metorex
def test
  list = []
  x = 1
  case x
  when 1
    list += [x]
  end
  list
end

out = test()
puts out.length
```
