---
title: "threads/sleeping_hands_turns.rb"
slug: threads-sleeping-hands-turns
description: "The metorex example program threads/sleeping_hands_turns.rb and its output."
---

`tests/_examples/threads/sleeping_hands_turns.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/sleeping_hands_turns.rb){target=_blank rel=noopener}.

```metorex
# A thread that sleeps for a length lets the other threads run until the
# length passes, and a sleep is cut short by a wakeup.

log = []
sleeper = Thread.new do
  log << :sleeper_start
  sleep(0.05)
  log << :sleeper_end
end
worker = Thread.new { log << :worker }
[sleeper, worker].each(&:join)
p(log)


napper = Thread.new { sleep(5) }
Thread.pass until napper.status == "sleep"
napper.wakeup
p(napper.value)
```

Output:

```
[:sleeper_start, :worker, :sleeper_end]
0
```
