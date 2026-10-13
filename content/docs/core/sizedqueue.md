---
title: "SizedQueue"
slug: sizedqueue
description: "The methods ruby/spec describes in core/sizedqueue, and which Metorex implements."
---

ruby/spec describes 17 methods in `core/sizedqueue`, and Metorex implements 17 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`SizedQueue#<<`**: implemented, parameters `[[:rest, :args]]`. Pushes `object` to the queue.
- **`SizedQueue#clear`**: implemented, parameters `[]`. Removes all objects from the queue. [An example calling it](/examples/array-methods-counted-min-max).
- **`SizedQueue#close`**: implemented, parameters `[]`. Similar to Thread::Queue#close. [An example calling it](/examples/addresses-socket-open-timeout).
- **`SizedQueue#closed?`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-state-and-time).
- **`SizedQueue#deq`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-fetcher-compact-index).
- **`SizedQueue#empty?`**: implemented, parameters `[]`. [An example calling it](/examples/basics-stdout-redirection).
- **`SizedQueue#enq`**: implemented, parameters `[[:rest, :args]]`. Pushes `object` to the queue. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-definition).
- **`SizedQueue#freeze`**: implemented, parameters `[]`. Prevents further modifications to *obj*. [An example calling it](/examples/builtins-core-state-and-time).
- **`SizedQueue#length`**: implemented, parameters `[]`. [An example calling it](/examples/advanced-parenless-splat).
- **`SizedQueue#max`**: implemented, parameters `[]`. Returns the maximum size of the queue. [An example calling it](/examples/array-methods-counted-min-max).
- **`SizedQueue#max=`**: implemented, parameters `[[:req]]`. Sets the maximum size of the queue to the given `number`.
- **`SizedQueue.new`**: implemented, parameters `[[:rest]]`. Creates a fixed-length queue with a maximum size of `max`. [An example calling it](/examples/advanced-queues-that-wait).
- **`SizedQueue#num_waiting`**: implemented, parameters `[]`. Returns the number of threads waiting on the queue. [An example calling it](/examples/advanced-queues-that-wait).
- **`SizedQueue#pop`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/advanced-queues-that-deadlock).
- **`SizedQueue#push`**: implemented, parameters `[[:rest, :args]]`. Pushes `object` to the queue. [An example calling it](/examples/advanced-queues-that-wait).
- **`SizedQueue#shift`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/array-methods-set-operations-and-lookup).
- **`SizedQueue#size`**: implemented, parameters `[]`. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
