---
title: "ConditionVariable"
slug: conditionvariable
description: "The methods ruby/spec describes in core/conditionvariable, and which Metorex implements."
---

ruby/spec describes 4 methods in `core/conditionvariable`, and Metorex implements 4 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`ConditionVariable#broadcast`**: implemented, parameters `[[:rest, :args]]`. Wakes up all threads waiting for this lock. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-connection-pool-lib-connection-pool-timed-stack).
- **`ConditionVariable#marshal_dump`**: implemented, parameters `[]`.
- **`ConditionVariable#signal`**: implemented, parameters `[[:rest, :args]]`. Wakes up the first thread in line waiting for this lock. [An example calling it](/examples/advanced-threads-that-wake).
- **`ConditionVariable#wait`**: implemented, parameters `[[:rest, :args]]`. Releases the lock held in the associated monitor and waits; reacquires the lock on wakeup. [An example calling it](/examples/advanced-condition-variables-that-deadlock).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
