---
title: "Mutex"
slug: mutex
description: "The methods ruby/spec describes in core/mutex, and which Metorex implements."
---

ruby/spec describes 7 methods in `core/mutex`, and Metorex implements 7 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Mutex#lock`**: implemented, parameters `[[:rest, :args]]`. Attempts to grab the lock and waits if it isn't available. [An example calling it](/examples/advanced-mutexes-that-deadlock).
- **`Mutex#locked?`**: implemented, parameters `[[:rest, :args]]`. Returns `true` if this lock is currently held by some thread. [An example calling it](/examples/advanced-threads-leave-their-waits).
- **`Mutex#owned?`**: implemented, parameters `[[:rest, :args]]`. Returns `true` if this lock is currently held by current thread. [An example calling it](/examples/advanced-threads-that-wake).
- **`Mutex#sleep`**: implemented, parameters `[[:rest]]`. Releases the lock and sleeps `timeout` seconds if it is given and non-nil or forever. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-retry).
- **`Mutex#synchronize`**: implemented, parameters `[[:rest, :args]]`. Obtains a lock, runs the block, and releases the lock when the block completes. [An example calling it](/examples/advanced-condition-variables-that-deadlock).
- **`Mutex#try_lock`**: implemented, parameters `[[:rest, :args]]`. Attempts to obtain the lock and returns immediately. [An example calling it](/examples/c-extensions-c-mutexes).
- **`Mutex#unlock`**: implemented, parameters `[[:rest, :args]]`. Releases the lock. [An example calling it](/examples/advanced-threads-that-deadlock).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
