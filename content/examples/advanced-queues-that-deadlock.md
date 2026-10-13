---
title: "advanced/queues_that_deadlock.rb"
slug: advanced-queues-that-deadlock
description: "The metorex example program advanced/queues_that_deadlock.rb and its output."
---

`tests/_examples/advanced/queues_that_deadlock.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/queues_that_deadlock.rb).

```metorex
empty = Queue.new
begin
  empty.pop
rescue Exception => error
  p(error.class)
  puts(error.message.lines.first)
end
```

Output:

```
fatal
No live threads left. Deadlock?
```
