---
title: "methods/def/implicit_return_after_while.rb"
slug: methods-def-implicit-return-after-while
description: "The metorex example program methods/def/implicit_return_after_while.rb and its output."
---

`tests/_examples/methods/def/implicit_return_after_while.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/def/implicit_return_after_while.rb){target=_blank rel=noopener}.

```metorex
def parse_args(argv)
  result = []
  while entry = argv.shift
    result << entry
  end
  result
end

out = parse_args(["a", "b", "c"])
puts out.length
```
