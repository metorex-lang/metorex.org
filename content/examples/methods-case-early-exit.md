---
title: "methods/case/early_exit.rb"
slug: methods-case-early-exit
description: "The metorex example program methods/case/early_exit.rb and its output."
---

`tests/_examples/methods/case/early_exit.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/case/early_exit.rb){target=_blank rel=noopener}.

```metorex
def test
  puts "A"
  x = 1
  case x
  when 1
    puts "match"
  end
  puts "after"
end

test()
```
