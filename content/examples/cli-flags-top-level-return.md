---
title: "cli_flags/top_level_return.rb"
slug: cli-flags-top-level-return
description: "The metorex example program cli_flags/top_level_return.rb and its output."
---

`tests/_examples/cli_flags/top_level_return.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/top_level_return.rb){target=_blank rel=noopener}.

```metorex
# A `return` written at the top level ends the file, and the value written
# after it goes nowhere, which Ruby says so on standard error.
puts "before"
return 10
puts "after"
```
