---
title: "threads/condition_variable_barrier.rb"
slug: threads-condition-variable-barrier
description: "The metorex example program threads/condition_variable_barrier.rb and its output."
---

`tests/_examples/threads/condition_variable_barrier.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/condition_variable_barrier.rb){target=_blank rel=noopener}.

```metorex
# Threads meeting at a barrier: each waits until the last one arrives, and the
# last one wakes them all.
count = 4
state = 0
guard = Mutex.new
gate = ConditionVariable.new
order = []

threads = (1..count).map do |number|
  Thread.new do
    guard.synchronize do
      state += 1
      if state >= count
        order << :last
        gate.broadcast
      else
        gate.wait guard
        order << :woken
      end
    end
    number
  end
end

puts threads.map(&:value).inspect
puts order.sort.inspect
puts order.length
```

Output:

```
[1, 2, 3, 4]
[:last, :woken, :woken, :woken]
4
```
