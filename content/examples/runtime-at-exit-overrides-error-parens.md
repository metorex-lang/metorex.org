---
title: "runtime/at_exit_overrides_error_parens.rb"
slug: runtime-at-exit-overrides-error-parens
description: "The metorex example program runtime/at_exit_overrides_error_parens.rb and its output."
---

`tests/_examples/runtime/at_exit_overrides_error_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/at_exit_overrides_error_parens.rb){target=_blank rel=noopener}.

```metorex
at_exit do
  puts("in at_exit")
  puts("$! is #{$!.class}:#{$!.message}")
  exit!(21)
end

raise("original error")
```
