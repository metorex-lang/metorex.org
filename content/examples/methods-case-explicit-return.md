---
title: "methods/case/explicit_return.rb"
slug: methods-case-explicit-return
description: "The metorex example program methods/case/explicit_return.rb and its output."
---

`tests/_examples/methods/case/explicit_return.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/case/explicit_return.rb){target=_blank rel=noopener}.

```metorex
def test
  list = []
  x = 1
  case x
  when 1
    list += [x]
  end
  puts "after case list=#{list.length}"
  return list
end

out = test()
puts out.length
```
