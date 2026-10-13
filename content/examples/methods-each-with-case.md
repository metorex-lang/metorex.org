---
title: "methods/each/with_case.rb"
slug: methods-each-with-case
description: "The metorex example program methods/each/with_case.rb and its output."
---

`tests/_examples/methods/each/with_case.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/each/with_case.rb){target=_blank rel=noopener}.

```metorex
def test
  list = []
  [1].each do |x|
    case x
    when 1
      list += [x]
    end
  end
  list
end

out = test()
puts out.length
```
