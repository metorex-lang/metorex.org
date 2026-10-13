---
title: "Thread"
slug: thread
description: "The methods ruby/spec describes in core/thread, and which Metorex implements."
---

ruby/spec describes 69 methods in `core/thread`, and Metorex implements 67 of them. The parameters are what `Method#parameters` answers under Metorex.

## Thread

- **`Thread#[]`**: implemented, parameters `[[:req]]`. Attribute Reference---Returns the value of a fiber-local variable (current thread's root fiber if not explicitly inside a Fiber), using either a symbol or a string name.
- **`Thread#[]=`**: implemented, parameters `[[:req], [:req]]`. Attribute Assignment---Sets or creates the value of a fiber-local variable, using either a symbol or a string.
- **`Thread#abort_on_exception`**: implemented, parameters `[]`. Returns the status of the thread-local ``abort on exception'' condition for this `thr`. [An example calling it](/examples/advanced-threads-leave-their-waits).
- **`Thread.abort_on_exception`**: implemented, parameters `[]`. Returns the status of the global ``abort on exception'' condition.
- **`Thread#abort_on_exception=`**: implemented, parameters `[[:req, :wanted]]`. When set to `true`, if this `thr` is aborted by an exception, the raised exception will be re-raised in the main thread.
- **`Thread.abort_on_exception=`**: implemented, parameters `[[:req, :wanted]]`. When set to `true`, if any thread is aborted by an exception, the raised exception will be re-raised in the main thread.
- **`Thread#add_trace_func`**: implemented, parameters `[[:req]]`. Adds *proc* as a handler for tracing.
- **`Thread#alive?`**: implemented, parameters `[]`. Returns `true` if `thr` is running or sleeping. [An example calling it](/examples/threads-busy-threads-share-turns).
- **`Thread.allocate`**: implemented, parameters `[[:req, :args]]`.
- **`Thread#backtrace`**: implemented, parameters `[[:rest]]`. Returns the current backtrace of the target thread. [An example calling it](/examples/threads-interrupted-backtraces).
- **`Thread#backtrace_locations`**: implemented, parameters `[[:rest]]`. Returns the execution stack for the target thread---an array containing backtrace location objects. [An example calling it](/examples/backtraces-chained-call-line).
- **`Thread.current`**: implemented, parameters `[[:req, :args]]`. Returns the currently executing thread. [An example calling it](/examples/threads-exiting-from-a-thread).
- **`Thread.each_caller_location`**: implemented, parameters `[[:rest, :args], [:keyrest, :keywords]]`. Yields each frame of the current execution stack as a backtrace location object.
- **`Thread#exit`**: implemented, parameters `[]`. Terminates `thr` and schedules another thread to be run, returning the terminated Thread. [An example calling it](/examples/errors-exit-status-coercion).
- **`Thread.exit`**: implemented, parameters `[[:rest]]`. Terminates the currently running thread and schedules another thread to be run.
- **`Thread#exit!`**: implemented, parameters `[[:rest]]`. Exits the process immediately; no exit handlers are called. [An example calling it](/examples/runtime-fork-child-process).
- **`Thread#fetch`**: implemented, parameters `[[:req, :name], [:rest, :default], [:block, :block]]`. Returns a fiber-local for the given key. [An example calling it](/examples/advanced-implicit-block-capture).
- **`Thread.fork`**: implemented, parameters `[]`. Basically the same as ::new.
- **`Thread#group`**: implemented, parameters `[]`. Returns the ThreadGroup which contains the given thread. [An example calling it](/examples/threads-thread-group-list).
- **`Thread.handle_interrupt`**: implemented, parameters `[[:req, :mapping]]`. Changes asynchronous interrupt timing. [An example calling it](/examples/advanced-fibers-that-schedule).
- **`Thread.ignore_deadlock`**: implemented, parameters `[]`. Returns the status of the global ``ignore deadlock'' condition. [An example calling it](/examples/builtins-core-class-additions).
- **`Thread.ignore_deadlock=`**: implemented, parameters `[[:req, :ignored]]`. Returns the new state.
- **`Thread#initialize`**: implemented, parameters `[[:rest, :_arguments]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Thread#inspect`**: implemented, parameters `[]`. Dump the name, id, and status of *thr* to a string. [An example calling it](/examples/threads-autoload-one-at-a-time).
- **`Thread#join`**: implemented, parameters `[[:rest]]`. The calling thread will suspend execution and run this `thr`. [An example calling it](/examples/threads-autoload-one-at-a-time).
- **`Thread#key?`**: implemented, parameters `[[:req]]`. Returns `true` if the given string (or symbol) exists as a fiber-local variable. [An example calling it](/examples/algorithms-character-counter).
- **`Thread#keys`**: implemented, parameters `[]`. Returns an array of the names of the fiber-local variables (as Symbols). [An example calling it](/examples/basics-symbols-operator-names).
- **`Thread#kill`**: implemented, parameters `[]`. Terminates `thr` and schedules another thread to be run, returning the terminated Thread. [An example calling it](/examples/threads-busy-threads-share-turns).
- **`Thread.kill`**: implemented, parameters `[[:req, :args]]`. Causes the given `thread` to exit, see also Thread::exit.
- **`Thread.list`**: implemented, parameters `[[:req, :args]]`. Returns an array of Thread objects for all threads that are either runnable or stopped.
- **`Thread.main`**: implemented, parameters `[[:req, :args]]`. Returns the main thread. [An example calling it](/examples/threads-thread-group-list).
- **`Thread#name`**: implemented, parameters `[]`. show the name of the thread. [An example calling it](/examples/threads-thread-names-and-backtraces).
- **`Thread#name=`**: implemented, parameters `[[:req]]`. set given name to the ruby thread.
- **`Thread#native_thread_id`**: implemented, parameters `[]`. Return the native thread ID which is used by the Ruby thread. [An example calling it](/examples/advanced-native-thread-ids).

  Metorex: Answers nil for a thread waiting its turn, since every Metorex thread runs on the one operating system thread the interpreter runs on.
- **`Thread.new`**: implemented, parameters `[[:rest]]`. Creates a new thread executing the given block. [An example calling it](/examples/threads-autoload-one-at-a-time).
- **`Thread.pass`**: implemented, parameters `[[:req, :args]]`. Give the thread scheduler a hint to pass execution to another thread. [An example calling it](/examples/threads-autoload-one-at-a-time).
- **`Thread#pending_interrupt?`**: implemented, parameters `[[:opt, :_error]]`. Returns whether or not the asynchronous queue is empty for the target thread. [An example calling it](/examples/advanced-fibers-that-schedule).
- **`Thread.pending_interrupt?`**: implemented, parameters `[[:opt, :_error]]`. Returns whether or not the asynchronous queue is empty. [An example calling it](/examples/advanced-fibers-that-schedule).
- **`Thread#priority`**: implemented, parameters `[]`. Returns the priority of *thr*. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-resolver-candidate).
- **`Thread#priority=`**: implemented, parameters `[[:req]]`. Sets the priority of *thr* to *integer*.
- **`Thread#raise`**: implemented, parameters `[[:rest, :arguments], [:keyrest, :options]]`. Raises an exception from the given thread. [An example calling it](/examples/threads-interrupted-backtraces).
- **`Thread#report_on_exception`**: implemented, parameters `[]`. Returns the status of the thread-local ``report on exception'' condition for this `thr`. [An example calling it](/examples/threads-exiting-from-a-thread).
- **`Thread.report_on_exception`**: implemented, parameters `[[:req, :args]]`. Returns the status of the global ``report on exception'' condition. [An example calling it](/examples/threads-thread-class-settings).
- **`Thread#report_on_exception=`**: implemented, parameters `[[:req, :wanted]]`. When set to `true`, a message is printed on $stderr if an exception kills this `thr`.
- **`Thread.report_on_exception=`**: implemented, parameters `[[:req, :args]]`. Returns the new state.
- **`Thread#run`**: implemented, parameters `[]`. Wakes up `thr`, making it eligible for scheduling. [An example calling it](/examples/c-extensions-c-iteration).
- **`Thread#set_trace_func`**: implemented, parameters `[[:req, :callable]]`. Establishes *proc* on *thr* as the handler for tracing, or disables tracing if the parameter is `nil`.
- **`Thread.start`**: implemented, parameters `[[:req, :args]]`. Basically the same as ::new. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-worker).
- **`Thread#status`**: implemented, parameters `[]`. Returns the status of `thr`. [An example calling it](/examples/threads-busy-threads-share-turns).
- **`Thread.stop`**: implemented, parameters `[]`. Stops execution of the current thread, putting it into a ``sleep'' state, and schedules execution of another thread. [An example calling it](/examples/advanced-mutexes-that-deadlock).
- **`Thread#stop?`**: implemented, parameters `[]`. Returns `true` if `thr` is dead or sleeping. [An example calling it](/examples/threads-interrupted-backtraces).
- **`Thread#terminate`**: implemented, parameters `[]`. Terminates `thr` and schedules another thread to be run, returning the terminated Thread. [An example calling it](/examples/scanning-reading-a-string).
- **`Thread#thread_variable?`**: implemented, parameters `[[:req]]`. Returns `true` if the given string (or symbol) exists as a thread-local variable.
- **`Thread#thread_variable_get`**: implemented, parameters `[[:req]]`. Returns the value of a thread local variable that has been set. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-ui-shell).
- **`Thread#thread_variable_set`**: implemented, parameters `[[:req], [:req]]`. Sets a thread local with `key` to `value`. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-ui-shell).
- **`Thread#thread_variables`**: implemented, parameters `[]`. Returns an array of the names of the thread-local variables (as Symbols).
- **`Thread#to_s`**: implemented, parameters `[]`. Dump the name, id, and status of *thr* to a string. [An example calling it](/examples/threads-fixtures-waits-for-term).
- **`Thread#value`**: implemented, parameters `[]`. Waits for `thr` to complete, using #join, and returns its value or raises the exception which terminated the thread. [An example calling it](/examples/threads-autoload-under-load).
- **`Thread#wakeup`**: implemented, parameters `[]`. Marks a given thread as eligible for scheduling, however it may still remain blocked on I/O. [An example calling it](/examples/threads-sleeping-hands-turns).

## Thread::Backtrace

- **`Thread::Backtrace.limit`**: implemented, parameters `[]`. Returns maximum backtrace length set by <code>--backtrace-limit</code> command-line option.

## Thread::Backtrace::Location

- **`Thread::Backtrace::Location#absolute_path`**: implemented, parameters `[]`. Returns the full file path of this frame. [An example calling it](/examples/errors-backtrace-locations-fields).
- **`Thread::Backtrace::Location#base_label`**: implemented, parameters `[]`. Returns the base label of this frame, which is usually equal to the label, without decoration. [An example calling it](/examples/errors-backtrace-locations-fields).
- **`Thread::Backtrace::Location#inspect`**: implemented, parameters `[]`. Returns the same as calling `inspect` on the string representation of #to_str [An example calling it](/examples/addresses-internet-addresses).
- **`Thread::Backtrace::Location#label`**: implemented, parameters `[]`. Returns the label of this frame. [An example calling it](/examples/backtraces-chained-call-line).
- **`Thread::Backtrace::Location#lineno`**: implemented, parameters `[]`. Returns the line number of this frame. [An example calling it](/examples/backtraces-block-file-test).
- **`Thread::Backtrace::Location#path`**: implemented, parameters `[]`. Returns the file name of this frame. [An example calling it](/examples/addresses-uniform-resources).
- **`Thread::Backtrace::Location#source_range`**: not implemented.
- **`Thread::Backtrace::Location#syntax_tree`**: not implemented.
- **`Thread::Backtrace::Location#to_s`**: implemented, parameters `[]`. Returns a Kernel#caller style string representing this frame. [An example calling it](/examples/addresses-internet-addresses).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
