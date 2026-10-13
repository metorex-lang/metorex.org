---
title: "runtime/at_exit_exit_status_parens.rb"
slug: runtime-at-exit-exit-status-parens
description: "The metorex example program runtime/at_exit_exit_status_parens.rb and its output."
---

`tests/_examples/runtime/at_exit_exit_status_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/at_exit_exit_status_parens.rb){target=_blank rel=noopener}.

```metorex
at_exit { puts("last handler") }
at_exit { exit(3) }
at_exit { puts("first handler") }
puts("main body")
exit(2)
```
