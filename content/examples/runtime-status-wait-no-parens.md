---
title: "runtime/status_wait_no_parens.rb"
slug: runtime-status-wait-no-parens
description: "The metorex example program runtime/status_wait_no_parens.rb and its output."
---

`tests/_examples/runtime/status_wait_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/status_wait_no_parens.rb).

```metorex
# Process::Status.wait answers a child's status and leaves $? alone.
p Process::Status.wait.pid
pid = Process.spawn("true")
status = Process::Status.wait
p status.pid == pid
p status.class
p $?.nil?
```

Output:

```
-1
true
Process::Status
true
```
