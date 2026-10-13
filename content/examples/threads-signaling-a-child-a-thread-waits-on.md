---
title: "threads/signaling_a_child_a_thread_waits_on.rb"
slug: threads-signaling-a-child-a-thread-waits-on
description: "The metorex example program threads/signaling_a_child_a_thread_waits_on.rb and its output."
---

`tests/_examples/threads/signaling_a_child_a_thread_waits_on.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/signaling_a_child_a_thread_waits_on.rb).

```metorex
# A thread reading from a child lets the main thread signal that child.
require "tmpdir"
require "rbconfig"
pid_file = File.join(Dir.tmpdir, "metorex_waits_for_term_#{Process.pid}")
File.delete(pid_file) if File.exist?(pid_file)
fixture = File.join(__dir__, "fixtures", "waits_for_term.rb")
reader = Thread.new do
  IO.popen([RbConfig.ruby, fixture, pid_file]) { |io| io.read }
end
Thread.pass until File.exist?(pid_file) && !File.read(pid_file).empty?
Process.kill(:TERM, File.read(pid_file).to_i)
p(reader.value)
File.delete(pid_file)
```

Output:

```
"signaled\n"
```
