---
title: "signals/child_status_no_parens.rb"
slug: signals-child-status-no-parens
description: "The metorex example program signals/child_status_no_parens.rb and its output."
---

`tests/_examples/signals/child_status_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/child_status_no_parens.rb).

```metorex
# A child's status reads how it ended: the code it exited with, the signal
# that ended it, or the signal that stopped it.
def described(status)
  [
    status.to_s.sub(/pid \d+/, "pid N").gsub(/\(signal (\d+)\)/) { "(signal #{Signal.signame($1.to_i)})" },
    status.inspect.sub(/pid \d+/, "pid N").gsub(/\(signal (\d+)\)/) { "(signal #{Signal.signame($1.to_i)})" },
    status.exited?, status.exitstatus, status.success?,
    status.signaled?, status.termsig && Signal.signame(status.termsig),
    status.stopped?, status.stopsig && Signal.signame(status.stopsig),
    status.coredump?
  ]
end

system("exit 0")
p described($?)
system("exit 3")
p described($?)
p $?.exitstatus

killed = spawn("sleep 5")
Process.kill(:KILL, killed)
Process.wait(killed)
p described($?)

stopped = spawn("sleep 5")
Process.kill(:STOP, stopped)
_, status = Process.waitpid2(stopped, Process::WUNTRACED)
p described(status)
Process.kill(:KILL, stopped)
Process.wait(stopped)

terminated = spawn("sh", "-c", "kill -TERM $$")
Process.wait(terminated)
p described($?)

p Process::Status.instance_methods(false).sort
```

Output:

```
["pid N exit 0", "#<Process::Status: pid N exit 0>", true, 0, true, false, nil, false, nil, false]
["pid N exit 3", "#<Process::Status: pid N exit 3>", true, 3, false, false, nil, false, nil, false]
3
["pid N SIGKILL (signal KILL)", "#<Process::Status: pid N SIGKILL (signal KILL)>", false, nil, nil, true, "KILL", false, nil, false]
["pid N stopped SIGSTOP (signal STOP)", "#<Process::Status: pid N stopped SIGSTOP (signal STOP)>", false, nil, nil, false, nil, true, "STOP", false]
["pid N SIGTERM (signal TERM)", "#<Process::Status: pid N SIGTERM (signal TERM)>", false, nil, nil, true, "TERM", false, nil, false]
[:==, :coredump?, :exited?, :exitstatus, :inspect, :pid, :signaled?, :stopped?, :stopsig, :success?, :termsig, :to_i, :to_s]
```
