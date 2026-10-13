---
title: "errors/using_scope/main_using_parens.rb"
slug: errors-using-scope-main-using-parens
description: "The metorex example program errors/using_scope/main_using_parens.rb and its output."
---

`tests/_examples/errors/using_scope/main_using_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/using_scope/main_using_parens.rb){target=_blank rel=noopener}.

```metorex
MAIN = self

module X
  begin
    MAIN.send(:using, Module.new)
  rescue RuntimeError => error
    puts(error.message)
  end
end

MAIN.send(:using, Module.new)
puts("toplevel using allowed")
```

Output:

```
main.using is permitted only at toplevel
toplevel using allowed
```
