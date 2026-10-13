---
title: "basics/for_loop_continue.rb"
slug: basics-for-loop-continue
description: "The metorex example program basics/for_loop_continue.rb and its output."
---

`tests/_examples/basics/for_loop_continue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/for_loop_continue.rb){target=_blank rel=noopener}.

```metorex
# A for loop that skips one value with next
for i in 1..5
  if i == 3
    next
  end
  puts i
end
```

Output:

```
1
2
4
5
```
