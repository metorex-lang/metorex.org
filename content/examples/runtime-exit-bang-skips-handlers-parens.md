---
title: "runtime/exit_bang_skips_handlers_parens.rb"
slug: runtime-exit-bang-skips-handlers-parens
description: "The metorex example program runtime/exit_bang_skips_handlers_parens.rb and its output."
---

`tests/_examples/runtime/exit_bang_skips_handlers_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/exit_bang_skips_handlers_parens.rb){target=_blank rel=noopener}.

```metorex
at_exit { puts("handler should not run") }

begin
  puts("before")
  exit!(21)
ensure
  puts("ensure should not run")
end
```
