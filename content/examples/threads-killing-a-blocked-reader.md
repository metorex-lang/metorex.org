---
title: "threads/killing_a_blocked_reader.rb"
slug: threads-killing-a-blocked-reader
description: "The metorex example program threads/killing_a_blocked_reader.rb and its output."
---

`tests/_examples/threads/killing_a_blocked_reader.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/killing_a_blocked_reader.rb){target=_blank rel=noopener}.

```metorex
# A thread waiting to read a pipe or a socket is asleep, and killing it ends
# the wait: its value is nil.
require "socket"

reader, writer = IO.pipe
piped = Thread.new { reader.readpartial(10) }
Thread.pass until piped.stop?
p(piped.status)
piped.kill
p(piped.value)
p(piped.status)

near, far = UNIXSocket.pair
socketed = Thread.new { near.read(10) }
Thread.pass until socketed.stop?
socketed.kill
p(socketed.value)
far.close
writer.close
```

Output:

```
"sleep"
nil
false
nil
```
