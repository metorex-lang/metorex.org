---
title: "errors/recursing_too_deep.rb"
slug: errors-recursing-too-deep
description: "The metorex example program errors/recursing_too_deep.rb and its output."
---

`tests/_examples/errors/recursing_too_deep.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/recursing_too_deep.rb){target=_blank rel=noopener}.

```metorex
# A method that calls itself without end raises SystemStackError, which the
# program can rescue.
def deeper(level)
  deeper(level + 1)
end

begin
  deeper(0)
rescue SystemStackError => error
  p(error.class)
  p(error.message)
end
p(:carried_on)
```

Output:

```
SystemStackError
"stack level too deep"
:carried_on
```
