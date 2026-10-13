---
title: "GC"
slug: gc
description: "The methods ruby/spec describes in core/gc, and which Metorex implements."
---

ruby/spec describes 19 methods in `core/gc`, and Metorex implements 18 of them. The parameters are what `Method#parameters` answers under Metorex.

## GC

- **`GC.auto_compact`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC.config`**: implemented, parameters `[[:opt, :options]]`. This method is implementation-specific to CRuby. [An example calling it](/examples/site-differences-gc-config).

  Metorex: `GC.config[:implementation]` is `"metorex"`, where MRI answers `"default"`, since Metorex frees an object when the last reference to it goes.
- **`GC.count`**: implemented, parameters `[[:rest]]`. Returns the total number of times garbage collection has occurred: [An example calling it](/examples/builtins-core-class-additions).
- **`GC.disable`**: implemented, parameters `[]`. Disables garbage collection (but GC.start remains potent): returns whether garbage collection was already disabled. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC.enable`**: implemented, parameters `[]`. Enables garbage collection; returns whether garbage collection was disabled: [An example calling it](/examples/builtins-core-state-and-time).
- **`GC#garbage_collect`**: not implemented. Alias of GC.start
- **`GC.measure_total_time`**: implemented, parameters `[]`. Returns the setting for GC total time measurement; the initial setting is `true`. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC.start`**: implemented, parameters `[[:req, :args]]`. Initiates garbage collection, even if explicitly disabled by GC.disable. [An example calling it](/examples/builtins-core-class-additions).
- **`GC.stat`**: implemented, parameters `[[:opt, :target]]`. This method is implementation-specific to CRuby. [An example calling it](/examples/introspection-count-objects).
- **`GC.stress`**: implemented, parameters `[]`. Returns the current GC stress-mode setting, which initially is `false`. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC.stress=`**: implemented, parameters `[[:req, :wanted]]`. Enables or disables stress mode; enabling stress mode will degrade performance; it is only for debugging.
- **`GC.total_time`**: implemented, parameters `[[:req, :args]]`. Returns the GC total time in nanoseconds: [An example calling it](/examples/builtins-core-class-additions).

## GC::Profiler

- **`GC::Profiler.clear`**: implemented, parameters `[]`.
- **`GC::Profiler.disable`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC::Profiler.enable`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-state-and-time).
- **`GC::Profiler.enabled?`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-class-additions).
- **`GC::Profiler.report`**: implemented, parameters `[[:opt, :target]]`.
- **`GC::Profiler.result`**: implemented, parameters `[]`. [An example calling it](/examples/builtins-core-class-additions).
- **`GC::Profiler.total_time`**: implemented, parameters `[]`.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
