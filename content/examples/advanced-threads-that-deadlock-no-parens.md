---
title: "advanced/threads_that_deadlock_no_parens.rb"
slug: advanced-threads-that-deadlock-no-parens
description: "The metorex example program advanced/threads_that_deadlock_no_parens.rb and its output."
---

`tests/_examples/advanced/threads_that_deadlock_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_that_deadlock_no_parens.rb){target=_blank rel=noopener}.

```metorex
held = Mutex.new
held.lock
waiter = Thread.new { held.lock; :locked }
begin
  p waiter.value
rescue Exception => error
  p error.class
  puts error.message.lines.first
end
held.unlock
p waiter.value

begin
  Thread.stop
rescue ThreadError => error
  p error.message
end

Thread.new { sleep 0.05; Thread.main.wakeup }
sleep
puts "main woken"

busy = Mutex.new
busy.lock
blocked = Thread.new { busy.synchronize { :never } }
Thread.pass until blocked.status == "sleep"
blocked.kill
p blocked.join.status
p busy.locked?
```

Output:

```
fatal
No live threads left. Deadlock?
:locked
"stopping only thread\n\tnote: use sleep to stop forever"
main woken
false
true
```
