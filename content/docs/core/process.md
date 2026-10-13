---
title: "Process"
slug: process
description: "The methods ruby/spec describes in core/process, and which Metorex implements."
---

ruby/spec describes 103 methods in `core/process`, and Metorex implements 99 of them. The parameters are what `Method#parameters` answers under Metorex.

## Process

- **`Process._fork`**: implemented, parameters `[[:req, :args]]`. An internal API for fork. [An example calling it](/examples/runtime-forked-popen).
- **`Process.abort`**: implemented, parameters `[[:rest]]`. Terminates execution immediately, effectively by calling <code>Kernel.exit(false)</code>.
- **`Process.argv0`**: implemented, parameters `[[:req, :args]]`. Returns the name of the script being executed. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-self-manager).
- **`Process.clock_getres`**: implemented, parameters `[[:req, :args]]`. Returns a clock resolution as determined by POSIX function [clock_getres()](https://man7.org/linux/man-pages/man3/clock_getres.3.html):
- **`Process.clock_gettime`**: implemented, parameters `[[:req, :args]]`. Returns a clock time as determined by POSIX function [clock_gettime()](https://man7.org/linux/man-pages/man3/clock_gettime.3.html): [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-connection-pool-lib-connection-pool-timed-stack).
- **`Process.daemon`**: implemented, parameters `[[:req, :args]]`. Detaches the current process from its controlling terminal and runs it in the background as system daemon; returns zero. [An example calling it](/examples/methods-warn-parameters).
- **`Process.detach`**: implemented, parameters `[[:req, :pid]]`. Avoids the potential for a child process to become a [zombie process](https://en.wikipedia.org/wiki/Zombie_process).
- **`Process.egid`**: implemented, parameters `[[:req, :args]]`. Returns the effective group ID for the current process: [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process.egid=`**: implemented, parameters `[[:req, :args]]`. Sets the effective group ID for the current process.
- **`Process.euid`**: implemented, parameters `[[:req, :args]]`. Returns the effective user ID for the current process. [An example calling it](/examples/filesystem-permission-checks).
- **`Process.euid=`**: implemented, parameters `[[:req, :args]]`. Sets the effective user ID for the current process.
- **`Process.exec`**: implemented, parameters `[[:rest]]`. Replaces the current process by doing one of the following: [An example calling it](/examples/runtime-exec-with-options).
- **`Process.exit`**: implemented, parameters `[[:rest]]`. Initiates termination of the Ruby script by raising SystemExit; the exception may be caught.
- **`Process.exit!`**: implemented, parameters `[[:rest]]`. Exits the process immediately; no exit handlers are called. [An example calling it](/examples/runtime-fork-child-process).
- **`Process.fork`**: implemented, parameters `[]`. Creates a child process.
- **`Process.getpgid`**: implemented, parameters `[[:req, :args]]`. Not available on all platforms. [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process.getpgrp`**: implemented, parameters `[[:req, :args]]`. Returns the process group ID for the current process: [An example calling it](/examples/runtime-daemonizing).
- **`Process.getpriority`**: implemented, parameters `[[:req, :args]]`. Returns the scheduling priority for specified process, process group, or user. [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process.getrlimit`**: implemented, parameters `[[:req, :args]]`. Returns a 2-element array of the current (soft) limit and maximum (hard) limit for the given `resource`. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-net-http-persistent-lib-net-http-persistent).
- **`Process.gid`**: implemented, parameters `[[:req, :args]]`. Returns the (real) group ID for the current process: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`Process.gid=`**: implemented, parameters `[[:req, :args]]`. Sets the group ID for the current process to `new_gid`:
- **`Process.groups`**: implemented, parameters `[[:req, :args]]`. Returns an array of the group IDs in the supplemental group access list for the current process: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`Process.groups=`**: implemented, parameters `[[:req, :args]]`. Sets the supplemental group access list to the given array of group IDs.
- **`Process.initgroups`**: implemented, parameters `[[:req, :args]]`. Sets the supplemental group access list; the new list includes:
- **`Process.kill`**: implemented, parameters `[[:req, :args]]`. Sends a signal to each process specified by `ids` (which must specify at least one ID); returns the count of signals sent. [An example calling it](/examples/c-extensions-c-threads).
- **`Process#last_status`**: not implemented. Returns a Process::Status object representing the most recently exited child process in the current thread, or `nil` if none: [An example calling it](/examples/runtime-io-popen).
- **`Process.maxgroups`**: implemented, parameters `[[:req, :args]]`. Returns the maximum number of group IDs allowed in the supplemental group access list: [An example calling it](/examples/builtins-core-class-additions).
- **`Process.pid`**: implemented, parameters `[[:req, :args]]`. Returns the process ID of the current process: [An example calling it](/examples/addresses-streams-over-a-path).
- **`Process.ppid`**: implemented, parameters `[[:req, :args]]`. Returns the process ID of the parent of the current process: [An example calling it](/examples/builtins-core-state-and-time).
- **`Process.setpgid`**: implemented, parameters `[[:req, :args]]`. Sets the process group ID for the process given by process ID `pid` to `pgid`.
- **`Process.setpgrp`**: implemented, parameters `[[:req, :args]]`. Equivalent to <code>setpgid(0, 0)</code>.
- **`Process.setpriority`**: implemented, parameters `[[:req, :args]]`. See Process.getpriority.
- **`Process.setproctitle`**: implemented, parameters `[[:req, :args]]`. Sets the process title that appears on the ps(1) command. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-exec).
- **`Process.setrlimit`**: implemented, parameters `[[:req, :args]]`. Sets limits for the current process for the given `resource` to `cur_limit` (soft limit) and `max_limit` (hard limit); returns `nil`.
- **`Process.setsid`**: implemented, parameters `[[:req, :args]]`. Establishes the current process as a new session and process group leader, with no controlling tty; returns the session ID:
- **`Process.spawn`**: implemented, parameters `[[:rest]]`. Creates a new child process by doing one of the following in that process: [An example calling it](/examples/fibers-scheduler-hooks).
- **`Process.times`**: implemented, parameters `[[:req, :args]]`. Returns a Process::Tms structure that contains user and system CPU times for the current process, and for its children processes: [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process.uid`**: implemented, parameters `[[:req, :args]]`. Returns the (real) user ID of the current process. [An example calling it](/examples/filesystem-file-facts).
- **`Process.uid=`**: implemented, parameters `[[:req, :args]]`. Sets the (user) user ID for the current process to `new_uid`:
- **`Process.wait`**: implemented, parameters `[[:req, :args]]`. Waits for a suitable child process to exit, returns its process ID, and sets <code>$?</code> to a Process::Status object containing information on that process. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Process.wait2`**: implemented, parameters `[[:req, :args]]`. Like Process.waitpid, but returns an array containing the child process `pid` and Process::Status `status`: [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Process.waitall`**: implemented, parameters `[[:req, :args]]`. Waits for all children, returns an array of 2-element arrays; each subarray contains the integer pid and Process::Status status for one of the reaped child processes: [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Process.waitpid`**: implemented, parameters `[[:req, :args]]`. Waits for a suitable child process to exit, returns its process ID, and sets <code>$?</code> to a Process::Status object containing information on that process. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Process.waitpid2`**: implemented, parameters `[[:req, :args]]`. Like Process.waitpid, but returns an array containing the child process `pid` and Process::Status `status`: [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`Process.warmup`**: implemented, parameters `[[:req, :args]]`. Notify the Ruby virtual machine that the boot sequence is finished, and that now is a good time to optimize the application. [An example calling it](/examples/builtins-core-class-additions).

## Process::GID

- **`Process::GID.change_privilege`**: implemented, parameters `[[:req, :wanted]]`. Change the current process's real and effective group ID to that specified by *group*.
- **`Process::GID.eid`**: implemented, parameters `[]`. Returns the effective group ID for the current process:
- **`Process::GID.eid=`**: implemented, parameters `[[:req, :wanted]]`.
- **`Process::GID.grant_privilege`**: implemented, parameters `[[:req, :args]]`. Set the effective group ID, and if possible, the saved group ID of the process to the given *group*.
- **`Process::GID.re_exchange`**: implemented, parameters `[[:req, :args]]`. Exchange real and effective group IDs and return the new effective group ID.
- **`Process::GID.re_exchangeable?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the real and effective group IDs of a process may be exchanged on the current platform.
- **`Process::GID.rid`**: implemented, parameters `[]`. Returns the (real) group ID for the current process: [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process::GID.sid_available?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the current platform has saved group ID functionality.
- **`Process::GID.switch`**: implemented, parameters `[[:req, :args]]`. Switch the effective and real group IDs of the current process.

## Process::Status

- **`Process::Status#&`**: not implemented.
- **`Process::Status#==`**: implemented, parameters `[[:req]]`. Returns whether the value of #to_i == `other`:
- **`Process::Status#>>`**: not implemented.
- **`Process::Status#coredump?`**: implemented, parameters `[]`. Returns `true` if the process generated a coredump when it terminated, `false` if not. [An example calling it](/examples/signals-child-status).
- **`Process::Status#exited?`**: implemented, parameters `[]`. Returns `true` if the process exited normally (for example using an <code>exit()</code> call or finishing the program), `false` if not. [An example calling it](/examples/runtime-backtick-command).
- **`Process::Status#exitstatus`**: implemented, parameters `[]`. Returns the least significant eight bits of the return code of the process if it has exited; `nil` otherwise: [An example calling it](/examples/programs-spawn-failures).
- **`Process::Status#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Process::Status#pid`**: implemented, parameters `[]`. Returns the process ID of the process: [An example calling it](/examples/addresses-streams-over-a-path).
- **`Process::Status#signaled?`**: implemented, parameters `[]`. Returns `true` if the process terminated because of an uncaught signal, `false` otherwise. [An example calling it](/examples/runtime-io-popen).
- **`Process::Status#stopped?`**: implemented, parameters `[]`. Returns `true` if this process is stopped, and if the corresponding #wait call had the Process::WUNTRACED flag set, `false` otherwise. [An example calling it](/examples/runtime-backtick-command).
- **`Process::Status#stopsig`**: implemented, parameters `[]`. Returns the number of the signal that caused the process to stop, or `nil` if the process is not stopped. [An example calling it](/examples/signals-child-status).
- **`Process::Status#success?`**: implemented, parameters `[]`. Returns: [An example calling it](/examples/advanced-native-thread-ids).
- **`Process::Status#termsig`**: implemented, parameters `[]`. Returns the number of the signal that caused the process to terminate or `nil` if the process was not terminated by an uncaught signal. [An example calling it](/examples/runtime-io-popen).
- **`Process::Status#to_i`**: implemented, parameters `[]`. Returns the system-dependent integer status of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Process::Status#to_int`**: not implemented. [An example calling it](/examples/builtins-kernel-argument-checks).
- **`Process::Status#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Process::Status.wait`**: implemented, parameters `[[:opt, :pid], [:opt, :flags]]`. Like Process.wait, but returns a Process::Status object (instead of an integer pid or nil); see Process.wait for the values of `pid` and `flags`. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).

## Process::Sys

- **`Process::Sys.getegid`**: implemented, parameters `[]`. Returns the effective group ID for the current process: [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process::Sys.geteuid`**: implemented, parameters `[]`. Returns the effective user ID for the current process.
- **`Process::Sys.getgid`**: implemented, parameters `[]`. Returns the (real) group ID for the current process:
- **`Process::Sys.getuid`**: implemented, parameters `[]`. Returns the (real) user ID of the current process. [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process::Sys.issetugid`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the process was created as a result of an execve(2) system call which had either of the setuid or setgid bits set (and extra privileges were given as a result) or if it has changed any of its real, effective or saved user or group IDs since it began execution.
- **`Process::Sys.setegid`**: implemented, parameters `[[:req, :wanted]]`. Set the effective group ID of the calling process to *group*.
- **`Process::Sys.seteuid`**: implemented, parameters `[[:req, :wanted]]`. Set the effective user ID of the calling process to *user*.
- **`Process::Sys.setgid`**: implemented, parameters `[[:req, :wanted]]`. Set the group ID of the current process to *group*.
- **`Process::Sys.setregid`**: implemented, parameters `[[:req, :args]]`. Sets the (group) real and/or effective group IDs of the current process to *rid* and *eid*, respectively.
- **`Process::Sys.setresgid`**: implemented, parameters `[[:req, :args]]`. Sets the (group) real, effective, and saved user IDs of the current process to *rid*, *eid*, and *sid* respectively.
- **`Process::Sys.setresuid`**: implemented, parameters `[[:req, :args]]`. Sets the (user) real, effective, and saved user IDs of the current process to *rid*, *eid*, and *sid* respectively.
- **`Process::Sys.setreuid`**: implemented, parameters `[[:req, :args]]`. Sets the (user) real and/or effective user IDs of the current process to *rid* and *eid*, respectively.
- **`Process::Sys.setrgid`**: implemented, parameters `[[:req, :args]]`. Set the real group ID of the calling process to *group*.
- **`Process::Sys.setruid`**: implemented, parameters `[[:req, :args]]`. Set the real user ID of the calling process to *user*.
- **`Process::Sys.setuid`**: implemented, parameters `[[:req, :wanted]]`. Set the user ID of the current process to *user*.

## Process::Tms

- **`Process::Tms#cstime`**: implemented, parameters `[]`. system time used in the child processes
- **`Process::Tms#cstime=`**: implemented, parameters `[[:req]]`.
- **`Process::Tms#cutime`**: implemented, parameters `[]`. user time used in the child processes
- **`Process::Tms#cutime=`**: implemented, parameters `[[:req]]`.
- **`Process::Tms#stime`**: implemented, parameters `[]`. system time used in this process
- **`Process::Tms#stime=`**: implemented, parameters `[[:req]]`.
- **`Process::Tms#utime`**: implemented, parameters `[]`. user time used in this process [An example calling it](/examples/builtins-core-class-additions).
- **`Process::Tms#utime=`**: implemented, parameters `[[:req]]`.

## Process::UID

- **`Process::UID.change_privilege`**: implemented, parameters `[[:req, :wanted]]`. Change the current process's real and effective user ID to that specified by *user*.
- **`Process::UID.eid`**: implemented, parameters `[]`. Returns the effective user ID for the current process.
- **`Process::UID.eid=`**: implemented, parameters `[[:req, :wanted]]`.
- **`Process::UID.grant_privilege`**: implemented, parameters `[[:req, :args]]`. Set the effective user ID, and if possible, the saved user ID of the process to the given *user*.
- **`Process::UID.re_exchange`**: implemented, parameters `[[:req, :args]]`. Exchange real and effective user IDs and return the new effective user ID.
- **`Process::UID.re_exchangeable?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the real and effective user IDs of a process may be exchanged on the current platform.
- **`Process::UID.rid`**: implemented, parameters `[]`. Returns the (real) user ID of the current process. [An example calling it](/examples/stdlib-libraries-process-identity).
- **`Process::UID.sid_available?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the current platform has saved user ID functionality.
- **`Process::UID.switch`**: implemented, parameters `[[:req, :args]]`. Switch the effective and real user IDs of the current process.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
