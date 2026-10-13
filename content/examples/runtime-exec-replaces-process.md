---
title: "runtime/exec_replaces_process.rb"
slug: runtime-exec-replaces-process
description: "The metorex example program runtime/exec_replaces_process.rb and its output."
---

`tests/_examples/runtime/exec_replaces_process.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/exec_replaces_process.rb).

```metorex
puts "before exec"
exec "echo replaced"
puts "never reached"
```

Output:

```
before exec
replaced
```
