---
title: "advanced/threads_that_stop_together.rb"
slug: advanced-threads-that-stop-together
description: "The metorex example program advanced/threads_that_stop_together.rb and its output."
---

`tests/_examples/advanced/threads_that_stop_together.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_that_stop_together.rb).

```metorex
stopped = Thread.new { Thread.stop }
Thread.pass until stopped.status == "sleep"
begin
  Thread.stop
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
