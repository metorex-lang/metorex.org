---
title: "runtime/io_popen.rb"
slug: runtime-io-popen
description: "The metorex example program runtime/io_popen.rb and its output."
---

`tests/_examples/runtime/io_popen.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/io_popen.rb){target=_blank rel=noopener}.

```metorex
io = IO.popen "echo hello"
print io.read
puts io.read.empty?
puts io.pid > 0
puts io.closed?
io.close
puts io.closed?

status = Process.last_status
puts status.exited?
puts status.exitstatus
puts status.signaled?
puts status.termsig.inspect
puts status.success?
puts status.to_i

puts IO.popen("printf one") { |child| child.read }

merged = IO.popen("printf err 1>&2", err: [:child, :out]) { |child| child.read }
puts merged

IO.popen("exit 3") { |child| child.read }
puts Process.last_status.exitstatus
puts Process.last_status.success?
```

Output:

```
hello
true
true
false
true
true
0
false
nil
true
0
one
err
3
false
```
