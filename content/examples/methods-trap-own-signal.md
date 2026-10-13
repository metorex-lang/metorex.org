---
title: "methods/trap_own_signal.rb"
slug: methods-trap-own-signal
description: "The metorex example program methods/trap_own_signal.rb and its output."
---

`tests/_examples/methods/trap_own_signal.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/trap_own_signal.rb){target=_blank rel=noopener}.

```metorex
received = []
trap("INT") { received << :interrupted }
Process.kill("INT", Process.pid)
sleep 0.1
p received
```

Output:

```
[:interrupted]
```
