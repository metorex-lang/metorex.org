---
title: "threads/ending_with_threads_alive.rb"
slug: threads-ending-with-threads-alive
description: "The metorex example program threads/ending_with_threads_alive.rb and its output."
---

`tests/_examples/threads/ending_with_threads_alive.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/ending_with_threads_alive.rb).

```metorex
# A program that ends takes its threads with it. Each thread unwinds where it
# waits, so the `ensure` clauses the fiber it is on sits inside run. A fiber
# the thread left suspended stays that way, and its own do not.

ready = false

Thread.new do
  suspended = Fiber.new do
    begin
      Fiber.yield
    ensure
      puts("the suspended fiber would say so here")
    end
  end
  suspended.resume

  waiting = Fiber.new do
    begin
      ready = true
      sleep
    ensure
      puts("the waiting fiber unwinds")
    end
  end
  waiting.resume
end

Thread.pass until ready
```

Output:

```
the waiting fiber unwinds
```
