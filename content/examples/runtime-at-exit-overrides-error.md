---
title: "runtime/at_exit_overrides_error.rb"
slug: runtime-at-exit-overrides-error
description: "The metorex example program runtime/at_exit_overrides_error.rb and its output."
---

`tests/_examples/runtime/at_exit_overrides_error.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/at_exit_overrides_error.rb).

```metorex
at_exit do
  puts "in at_exit"
  puts "$! is #{$!.class}:#{$!.message}"
  exit! 21
end

raise "original error"
```
