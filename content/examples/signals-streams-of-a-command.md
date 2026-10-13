---
title: "signals/streams_of_a_command.rb"
slug: signals-streams-of-a-command
description: "The metorex example program signals/streams_of_a_command.rb and its output."
---

`tests/_examples/signals/streams_of_a_command.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/streams_of_a_command.rb).

```metorex
# A command run with its error stream pointed at its output writes both into
# the one stream, in the order they were written, and a command ended by a
# signal says which signal ended it.

written = IO.popen(["/bin/sh", "-c", "echo to_the_output; echo to_the_error 1>&2"],
                   err: [:child, :out], &:read)
p(written)
p($?.exitstatus)

# Without the redirect, only what the command wrote to its output is read.
p(IO.popen(["/bin/sh", "-c", "echo only_the_output"], &:read))

ended = IO.popen(["/bin/sh", "-c", "kill -TERM $$"], err: [:child, :out], &:read)
p(ended)
p($?.termsig == Signal.list["TERM"])
p($?.exitstatus)
```

Output:

```
"to_the_output\nto_the_error\n"
0
"only_the_output\n"
""
true
nil
```
