---
title: "advanced/mutexes_that_deadlock_no_parens.rb"
slug: advanced-mutexes-that-deadlock-no-parens
description: "The metorex example program advanced/mutexes_that_deadlock_no_parens.rb and its output."
---

`tests/_examples/advanced/mutexes_that_deadlock_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/mutexes_that_deadlock_no_parens.rb).

```metorex
held = Mutex.new
holder = Thread.new { held.lock; Thread.stop }
Thread.pass until holder.status == "sleep"
begin
  held.lock
rescue Exception => error
  p error.class
  puts error.message.lines.first
end
```

Output:

```
fatal
No live threads left. Deadlock?
```
