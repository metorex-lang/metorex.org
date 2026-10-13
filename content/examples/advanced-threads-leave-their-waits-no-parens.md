---
title: "advanced/threads_leave_their_waits_no_parens.rb"
slug: advanced-threads-leave-their-waits-no-parens
description: "The metorex example program advanced/threads_leave_their_waits_no_parens.rb and its output."
---

`tests/_examples/advanced/threads_leave_their_waits_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_leave_their_waits_no_parens.rb).

```metorex
reader, writer = IO.pipe
waiting = Thread.new do
  reader.getc
rescue IOError => error
  "#{error.class}: #{error.message}"
end
Thread.pass until waiting.status == "sleep"
reader.close
p waiting.value

reader, writer = IO.pipe
writer.write_nonblock("x" * 4096, exception: false) until writer.write_nonblock("x", exception: false) == :wait_writable
filling = Thread.new do
  writer.write("y" * 100_000)
rescue IOError => error
  "#{error.class}: #{error.message}"
end
Thread.pass until filling.status == "sleep"
writer.close
p filling.value

stopped = Thread.new { Thread.stop; :resumed }
Thread.pass until stopped.status == "sleep"
stopped.wakeup
p stopped.value

held = Mutex.new
holder = Thread.new { held.lock; sleep }
Thread.pass until holder.status == "sleep"
Thread.new do
  Thread.current.report_on_exception = false
  Thread.current.abort_on_exception = true
  sleep 0.1
  raise "stopped the wait"
end
begin
  held.lock
rescue RuntimeError => error
  p error.message
end
p held.locked?
```

Output:

```
"IOError: stream closed in another thread"
"IOError: stream closed in another thread"
:resumed
"stopped the wait"
true
```
