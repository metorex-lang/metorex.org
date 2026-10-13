---
title: "stdlib_libraries/process_identity.rb"
slug: stdlib-libraries-process-identity
description: "The metorex example program stdlib_libraries/process_identity.rb and its output."
---

`tests/_examples/stdlib_libraries/process_identity.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/process_identity.rb).

```metorex
# What a process reports about itself: the groups and sessions it belongs to,
# the scheduling it runs under, and the ids it runs as.
p(Process.getpgrp == Process.getpgid(0))
p(Process.getsid == Process.getsid(0))
p(Process.getpriority(Process::PRIO_PROCESS, 0).is_a?(Integer))
p(Process.times.is_a?(Process::Tms))
p(Process.times.utime.is_a?(Float))

# The same ids go by more than one name.
p(Process::UID.rid == Process.uid)
p(Process::GID.rid == Process.gid)
p(Process::Sys.getuid == Process.uid)
p(Process::Sys.getegid == Process.egid)

# The constants the operating system names its settings by.
p([Process::WNOHANG, Process::WUNTRACED].all? { |held| held.is_a?(Integer) })
p([Process::PRIO_PROCESS, Process::PRIO_PGRP, Process::PRIO_USER].uniq.length)
p(Process::RLIMIT_NOFILE.is_a?(Integer))

# Renaming the process leaves `$0` alone, and `_fork` splits the process,
# answering 0 in the child.
p(Process.setproctitle("metorex-example"))
child = Process._fork
Process.exit! 0 if child == 0
p(Process.wait2(child)[1].exitstatus)

# A signal sent to a process that is not there is refused.
begin
  Process.kill(:TERM, 999_999)
rescue Errno::ESRCH => problem
  p(problem.class)
end

# Setting a group list without the right to do so is refused too.
begin
  Process.groups = [0]
rescue Errno::EPERM => problem
  p(problem.class)
end
```

Output:

```
true
true
true
true
true
true
true
true
true
true
3
true
"metorex-example"
0
Errno::ESRCH
Errno::EPERM
```
