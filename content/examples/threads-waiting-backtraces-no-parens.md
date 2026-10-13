---
title: "threads/waiting_backtraces_no_parens.rb"
slug: threads-waiting-backtraces-no-parens
description: "The metorex example program threads/waiting_backtraces_no_parens.rb and its output."
---

`tests/_examples/threads/waiting_backtraces_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/waiting_backtraces_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A thread waiting on a lock, a sleep, a queue or a condition variable
# answers a backtrace that starts at the method it waits in.
def short(lines)
  lines.map { |line| line.sub(/\A.*\//, "") }
end

held = Mutex.new
held.lock
locker = Thread.new { held.lock }
Thread.pass until locker.stop?
p short(locker.backtrace)

sleeper = Thread.new { sleep }
Thread.pass until sleeper.stop?
p short(sleeper.backtrace)

queue = Queue.new
popper = Thread.new { queue.pop }
Thread.pass until popper.stop?
p short(popper.backtrace)

signal = ConditionVariable.new
guard = Mutex.new
waiter = Thread.new { guard.synchronize { signal.wait(guard) } }
Thread.pass until waiter.stop?
p short(waiter.backtrace)

begin
  guard.synchronize { raise "inside" }
rescue RuntimeError => raised
  p(short(raised.backtrace))
end

[sleeper, popper, waiter].each(&:kill)
held.unlock
locker.join
```

Output:

```
["waiting_backtraces_no_parens.rb:9:in 'Thread::Mutex#lock'", "waiting_backtraces_no_parens.rb:9:in 'block in <main>'"]
["waiting_backtraces_no_parens.rb:13:in 'Kernel#sleep'", "waiting_backtraces_no_parens.rb:13:in 'block in <main>'"]
["waiting_backtraces_no_parens.rb:18:in 'Thread::Queue#pop'", "waiting_backtraces_no_parens.rb:18:in 'block in <main>'"]
["waiting_backtraces_no_parens.rb:24:in 'Thread::ConditionVariable#wait'", "waiting_backtraces_no_parens.rb:24:in 'block (2 levels) in <main>'", "waiting_backtraces_no_parens.rb:24:in 'Thread::Mutex#synchronize'", "waiting_backtraces_no_parens.rb:24:in 'block in <main>'"]
["waiting_backtraces_no_parens.rb:29:in 'block in <main>'", "waiting_backtraces_no_parens.rb:29:in 'Thread::Mutex#synchronize'", "waiting_backtraces_no_parens.rb:29:in '<main>'"]
```
