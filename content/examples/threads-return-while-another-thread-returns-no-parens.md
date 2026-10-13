---
title: "threads/return_while_another_thread_returns_no_parens.rb"
slug: threads-return-while-another-thread-returns-no-parens
description: "The metorex example program threads/return_while_another_thread_returns_no_parens.rb and its output."
---

`tests/_examples/threads/return_while_another_thread_returns_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/return_while_another_thread_returns_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A `return` in a block reaches its method even when another thread has
# returned from a method it entered earlier while this one waited.
$ready = false

def waiter
  loop do
    return :done if $ready
    Thread.pass
  end
end

def outer
  thread = Thread.new { waiter }
  Thread.pass
  thread
end

started = outer
$ready = true
p started.value
```

Output:

```
:done
```
