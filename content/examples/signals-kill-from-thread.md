---
title: "signals/kill_from_thread.rb"
slug: signals-kill-from-thread
description: "The metorex example program signals/kill_from_thread.rb and its output."
---

`tests/_examples/signals/kill_from_thread.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/kill_from_thread.rb).

```metorex
# A signal a thread sends this process is handled on the main thread.
ran_on = nil
previous = trap(:USR2) { ran_on = Thread.current == Thread.main }
Thread.new { Process.kill(:USR2, Process.pid) }.join
Thread.pass until ran_on
p ran_on
trap(:USR2, previous)

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
