---
title: "backtraces/at_exit_handler_raise.rb"
slug: backtraces-at-exit-handler-raise
description: "The metorex example program backtraces/at_exit_handler_raise.rb and its output."
---

`tests/_examples/backtraces/at_exit_handler_raise.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/at_exit_handler_raise.rb){target=_blank rel=noopener}.

```metorex
def boom = raise("closed")
at_exit do
  boom
rescue => error
  puts(error.backtrace.map { |line| File.basename(line) })
end
```

Output:

```
at_exit_handler_raise.rb:1:in 'Object#boom'
at_exit_handler_raise.rb:3:in 'block in <main>'
```
