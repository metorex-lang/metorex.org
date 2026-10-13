---
title: "runtime/at_exit_last_exception_parens.rb"
slug: runtime-at-exit-last-exception-parens
description: "The metorex example program runtime/at_exit_last_exception_parens.rb and its output."
---

`tests/_examples/runtime/at_exit_last_exception_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/at_exit_last_exception_parens.rb){target=_blank rel=noopener}.

```metorex
at_exit do
  puts($!.class)
  puts($!.message)
end

raise("boom")
```
