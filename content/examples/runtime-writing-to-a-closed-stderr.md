---
title: "runtime/writing_to_a_closed_stderr.rb"
slug: runtime-writing-to-a-closed-stderr
description: "The metorex example program runtime/writing_to_a_closed_stderr.rb and its output."
---

`tests/_examples/runtime/writing_to_a_closed_stderr.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/writing_to_a_closed_stderr.rb){target=_blank rel=noopener}.

```metorex
# A child started with its standard error closed finds it closed, and writing
# there raises.
require "rbconfig"
code = 'begin; STDERR.puts("unseen"); rescue SystemCallError => error; puts("rescued #{error.class}"); end'
reader, writer = IO.pipe()
pid = Process.spawn(RbConfig.ruby, "-e", code, out: writer, err: :close)
writer.close()
Process.wait(pid)
p(reader.read())
```

Output:

```
"rescued Errno::EBADF\n"
```
