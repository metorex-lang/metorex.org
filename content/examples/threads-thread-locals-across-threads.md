---
title: "threads/thread_locals_across_threads.rb"
slug: threads-thread-locals-across-threads
description: "The metorex example program threads/thread_locals_across_threads.rb and its output."
---

`tests/_examples/threads/thread_locals_across_threads.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/thread_locals_across_threads.rb){target=_blank rel=noopener}.

```metorex
# One thread reads what another has put in its own store, which is what a
# thread waiting on another's progress watches.
held = Thread.new do
  Thread.current[:marker] = true
  sleep 0.1
  :done
end

watcher = Thread.new do
  Thread.pass until held[:marker]
  :saw_it
end

puts watcher.value.inspect
puts held.value.inspect
puts held[:marker].inspect
```

Output:

```
:saw_it
:done
true
```
