---
title: "Fiber"
slug: fiber
description: "The methods ruby/spec describes in core/fiber, and which Metorex implements."
---

ruby/spec describes 21 methods in `core/fiber`, and Metorex implements 20 of them. The parameters are what `Method#parameters` answers under Metorex.

## Fiber

- **`Fiber.[]`**: implemented, parameters `[[:req, :args]]`. Returns the value of the fiber storage variable identified by `key`.
- **`Fiber.[]=`**: implemented, parameters `[[:req, :args]]`. Assign `value` to the fiber storage variable identified by `key`.
- **`Fiber#alive?`**: implemented, parameters `[]`. Returns true if the fiber can still be resumed (or transferred to). [An example calling it](/examples/fibers-raising).
- **`Fiber.blocking`**: implemented, parameters `[[:req, :args]]`. Forces the fiber to be blocking for the duration of the block.
- **`Fiber#blocking?`**: implemented, parameters `[]`. Returns `true` if `fiber` is blocking and `false` otherwise.
- **`Fiber.blocking?`**: implemented, parameters `[[:req, :args]]`. Returns `false` if the current fiber is non-blocking.
- **`Fiber.current`**: implemented, parameters `[[:req, :args]]`. Returns the current fiber. [An example calling it](/examples/fibers-raising).
- **`Fiber.current_scheduler`**: implemented, parameters `[[:req, :args]]`. Returns the Fiber scheduler, that was last set for the current thread with Fiber.set_scheduler if and only if the current fiber is non-blocking. [An example calling it](/examples/fibers-scheduler-hooks).
- **`Fiber#inspect`**: implemented, parameters `[]`. [An example calling it](/examples/addresses-internet-addresses).
- **`Fiber#kill`**: implemented, parameters `[]`. Terminates the fiber by raising an uncatchable exception. [An example calling it](/examples/advanced-native-thread-ids).
- **`Fiber.new`**: implemented, parameters `[[:rest]]`. Creates new Fiber. [An example calling it](/examples/fibers-raising).
- **`Fiber.new(storage:)`**: not implemented.
- **`Fiber#raise`**: implemented, parameters `[[:rest, :arguments], [:keyrest, :options]]`. Raises an exception in the fiber at the point at which the last <code>Fiber.yield</code> was called. [An example calling it](/examples/fibers-raising).
- **`Fiber#resume`**: implemented, parameters `[[:rest]]`. Resumes the fiber from the point at which the last Fiber.yield was called, or starts running it if it is the first call to #resume. [An example calling it](/examples/fibers-raising).
- **`Fiber.schedule`**: implemented, parameters `[[:req, :args]]`. The method is *expected* to immediately run the provided block of code in a separate non-blocking fiber. [An example calling it](/examples/fibers-scheduler-hooks).
- **`Fiber.scheduler`**: implemented, parameters `[[:req, :args]]`. Returns the Fiber scheduler, that was last set for the current thread with Fiber.set_scheduler. [An example calling it](/examples/fibers-scheduler-hooks).
- **`Fiber#storage`**: implemented, parameters `[]`. Returns a copy of the storage hash for the fiber.
- **`Fiber#storage=`**: implemented, parameters `[[:req]]`. Sets the storage hash for the fiber.
- **`Fiber#transfer`**: implemented, parameters `[[:rest]]`. Transfer control to another fiber, resuming it from where it last stopped or starting it if it was not resumed before. [An example calling it](/examples/fibers-raising).
- **`Fiber.yield`**: implemented, parameters `[[:req, :args]]`. Yields control back to the context that resumed the fiber, passing along any arguments that were passed to it. [An example calling it](/examples/fibers-raising).

## Thread

- **`Thread.new`**: implemented, parameters `[[:rest]]`. Creates a new thread executing the given block. [An example calling it](/examples/threads-autoload-one-at-a-time).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
