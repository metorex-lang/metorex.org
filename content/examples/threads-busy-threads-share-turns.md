---
title: "threads/busy_threads_share_turns.rb"
slug: threads-busy-threads-share-turns
description: "The metorex example program threads/busy_threads_share_turns.rb and its output."
---

`tests/_examples/threads/busy_threads_share_turns.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/busy_threads_share_turns.rb){target=_blank rel=noopener}.

```metorex
# A thread that never waits on anything still hands the turn over after a
# while, so the main thread runs again and can stop it.

count = 0
spinner = Thread.new { loop { count += 1 } }
Thread.pass until count > 0
p(spinner.alive?)
spinner.kill
spinner.join
p(spinner.status)

stepped = 0
stepper = Thread.new do
  index = 0
  while index < 30_000
    index += 1
    stepped = index
  end
  :finished
end
Thread.pass until stepped > 0
p(stepper.value)
```

Output:

```
true
false
:finished
```
