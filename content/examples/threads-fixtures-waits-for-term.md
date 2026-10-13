---
title: "threads/fixtures/waits_for_term.rb"
slug: threads-fixtures-waits-for-term
description: "The metorex example program threads/fixtures/waits_for_term.rb and its output."
---

`tests/_examples/threads/fixtures/waits_for_term.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/fixtures/waits_for_term.rb){target=_blank rel=noopener}.

```metorex
# Writes its pid to the file named, then waits for a TERM and says it got one.
Signal.trap(:TERM) { $signaled = true }
File.write(ARGV.shift, Process.pid.to_s)
sleep(0.001) until $signaled
puts("signaled")
```
