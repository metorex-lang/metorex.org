---
title: "signals/kill_from_thread_no_parens.rb"
slug: signals-kill-from-thread-no-parens
description: "The metorex example program signals/kill_from_thread_no_parens.rb and its output."
---

`tests/_examples/signals/kill_from_thread_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/kill_from_thread_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A signal a thread sends this process is handled on the main thread.
ran_on = nil
previous = trap(:USR2) { ran_on = Thread.current == Thread.main }
sender = Thread.new { Process.kill :USR2, Process.pid }
sender.join
Thread.pass until ran_on
p ran_on
trap :USR2, previous

# A signal name written with a minus is refused by `trap`.
begin
  Signal.trap("-HUP") {}
rescue ArgumentError => problem
  p problem.message
end
```

Output:

```
true
"negative signal name: -HUP"
```
