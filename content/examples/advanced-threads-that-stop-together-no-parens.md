---
title: "advanced/threads_that_stop_together_no_parens.rb"
slug: advanced-threads-that-stop-together-no-parens
description: "The metorex example program advanced/threads_that_stop_together_no_parens.rb and its output."
---

`tests/_examples/advanced/threads_that_stop_together_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_that_stop_together_no_parens.rb){target=_blank rel=noopener}.

```metorex
stopped = Thread.new { Thread.stop }
Thread.pass until stopped.status == "sleep"
begin
  Thread.stop
rescue Exception => error
  p error.class
  puts error.message.lines.first
end
```

Output:

```
fatal
No live threads left. Deadlock?
```
