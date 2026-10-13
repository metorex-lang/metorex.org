---
title: "signals/trapped_from_outside.rb"
slug: signals-trapped-from-outside
description: "The metorex example program signals/trapped_from_outside.rb and its output."
---

`tests/_examples/signals/trapped_from_outside.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/trapped_from_outside.rb).

```metorex
# A signal another process sends runs the handler Signal.trap installed.
received = []
Signal.trap(:TERM) { |number| received << number }
system("kill -TERM #{Process.pid}")
sleep(0.01) while received.empty?
p(received)
Signal.trap(:TERM, "DEFAULT")
p(Process.kill(0, Process.pid))
```

Output:

```
[15]
1
```
