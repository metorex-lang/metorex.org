---
title: "threads/locking_from_two_fibers.rb"
slug: threads-locking-from-two-fibers
description: "The metorex example program threads/locking_from_two_fibers.rb and its output."
---

`tests/_examples/threads/locking_from_two_fibers.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/locking_from_two_fibers.rb){target=_blank rel=noopener}.

```metorex
# A lock another fiber of the same thread holds cannot be waited for.
lock = Mutex.new
lock.lock()
begin
  Fiber.new { lock.lock() }.resume()
rescue ThreadError => error
  p(error.message)
end
lock.unlock()

holder = Fiber.new { lock.lock(); Fiber.yield(); lock.unlock() }
holder.resume()
begin
  Fiber.new { lock.lock() }.resume()
rescue ThreadError => error
  p(error.message)
end
holder.resume()
p(lock.locked?())
```

Output:

```
"deadlock; lock already owned by another fiber belonging to the same thread"
"deadlock; lock already owned by another fiber belonging to the same thread"
false
```
