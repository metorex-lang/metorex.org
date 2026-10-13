---
title: "runtime/signal_zero_no_parens.rb"
slug: runtime-signal-zero-no-parens
description: "The metorex example program runtime/signal_zero_no_parens.rb and its output."
---

`tests/_examples/runtime/signal_zero_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/signal_zero_no_parens.rb).

```metorex
# Process.kill with signal 0 checks that a process can be signaled.
p Process.kill 0, Process.pid
```

Output:

```
1
```
