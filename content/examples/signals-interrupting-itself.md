---
title: "signals/interrupting_itself.rb"
slug: signals-interrupting-itself
description: "The metorex example program signals/interrupting_itself.rb and its output."
---

`tests/_examples/signals/interrupting_itself.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/interrupting_itself.rb){target=_blank rel=noopener}.

```metorex
# A signal a program sends itself arrives inside the call that sent it, and an
# Interrupt carries the number of the signal it stands for.

begin
  Process.kill(:INT, Process.pid)
  sleep
rescue Interrupt => arrived
  p(arrived.signo == Signal.list["INT"])
  p(["", "Interrupt"].include?(arrived.message))
  p(arrived.backtrace.first.include?("Process.kill"))
end

# A command run with its error stream pointed at its output writes both into
# the one stream, in the order they were written.
written = IO.popen(["/bin/sh", "-c", "echo to_the_output; echo to_the_error 1>&2"],
                   err: [:child, :out], &:read)
p(written)
p($?.exitstatus)
```
