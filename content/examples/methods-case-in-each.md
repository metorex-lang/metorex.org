---
title: "methods/case/in_each.rb"
slug: methods-case-in-each
description: "The metorex example program methods/case/in_each.rb and its output."
---

`tests/_examples/methods/case/in_each.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/case/in_each.rb){target=_blank rel=noopener}.

```metorex
def test
  list = []
  [1].each do |x|
    case x
    when 1
      list += [x]
    else
      list += [0]
    end
  end
  list
end

out = test()
puts out.length
```
