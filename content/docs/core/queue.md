---
title: "Queue"
slug: queue
description: "The methods ruby/spec describes in core/queue, and which Metorex implements."
---

ruby/spec describes 15 methods in `core/queue`, and Metorex implements 15 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Queue#<<`**: implemented, parameters `[[:req]]`. Pushes the given `object` to the queue.
- **`Queue#clear`**: implemented, parameters `[]`. Removes all objects from the queue. [An example calling it](/examples/array-methods-counted-min-max).
- **`Queue#close`**: implemented, parameters `[]`. Closes the queue. [An example calling it](/examples/addresses-socket-open-timeout).
- **`Queue#closed?`**: implemented, parameters `[]`. Returns `true` if the queue is closed. [An example calling it](/examples/builtins-core-state-and-time).
- **`Queue#deq`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-fetcher-compact-index).
- **`Queue#empty?`**: implemented, parameters `[]`. Returns `true` if the queue is empty. [An example calling it](/examples/basics-stdout-redirection).
- **`Queue#enq`**: implemented, parameters `[[:req]]`. Pushes the given `object` to the queue. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-definition).
- **`Queue#freeze`**: implemented, parameters `[]`. The queue can't be frozen, so this method raises an exception: [An example calling it](/examples/builtins-core-state-and-time).
- **`Queue#initialize`**: implemented, parameters `[[:rest, :items]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Queue#length`**: implemented, parameters `[]`. Returns the length of the queue. [An example calling it](/examples/advanced-parenless-splat).
- **`Queue#num_waiting`**: implemented, parameters `[]`. Returns the number of threads waiting on the queue. [An example calling it](/examples/advanced-queues-that-wait).
- **`Queue#pop`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/advanced-queues-that-deadlock).
- **`Queue#push`**: implemented, parameters `[[:req]]`. Pushes the given `object` to the queue. [An example calling it](/examples/advanced-queues-that-wait).
- **`Queue#shift`**: implemented, parameters `[[:rest, :args]]`. Retrieves data from the queue. [An example calling it](/examples/array-methods-set-operations-and-lookup).
- **`Queue#size`**: implemented, parameters `[]`. Returns the length of the queue. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
