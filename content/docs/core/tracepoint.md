---
title: "TracePoint"
slug: tracepoint
description: "The methods ruby/spec describes in core/tracepoint, and which Metorex implements."
---

ruby/spec describes 19 methods in `core/tracepoint`, and Metorex implements 19 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`TracePoint.allow_reentry`**: implemented, parameters `[]`. Generally, while a TracePoint callback is running, other registered callbacks are not called to avoid confusion from reentrance.
- **`TracePoint#binding`**: implemented, parameters `[]`. Returns the generated binding object from the event. [An example calling it](/examples/callables-curried-shapes).
- **`TracePoint#callee_id`**: implemented, parameters `[]`. Returns the called name of the method being called.
- **`TracePoint#defined_class`**: implemented, parameters `[]`. Returns the class or module of the method being called. [An example calling it](/examples/introspection-tracepoint-events).
- **`TracePoint#disable`**: implemented, parameters `[[:block, :block]]`. Deactivates the trace. [An example calling it](/examples/builtins-core-state-and-time).
- **`TracePoint#enable`**: implemented, parameters `[[:key, :target], [:key, :target_line], [:key, :target_thread], [:block, :block]]`. Activates the trace. [An example calling it](/examples/builtins-core-state-and-time).
- **`TracePoint#enabled?`**: implemented, parameters `[]`. Returns the current status of the trace. [An example calling it](/examples/builtins-core-class-additions).
- **`TracePoint#eval_script`**: implemented, parameters `[]`. Returns the compiled source code (String) from eval methods on the <code>:script_compiled</code> event. [An example calling it](/examples/introspection-script-compiled).
- **`TracePoint#event`**: implemented, parameters `[]`. Returns the type of event. [An example calling it](/examples/builtins-pack-and-trace).
- **`TracePoint#inspect`**: implemented, parameters `[]`. Returns a string containing a human-readable TracePoint status. [An example calling it](/examples/addresses-internet-addresses).
- **`TracePoint#lineno`**: implemented, parameters `[]`. Returns the line number of the event. [An example calling it](/examples/backtraces-block-file-test).
- **`TracePoint#method_id`**: implemented, parameters `[]`. Returns the name at the definition of the method being called. [An example calling it](/examples/builtins-pack-and-trace).
- **`TracePoint.new`**: implemented, parameters `[[:rest, :events], [:block, :block]]`. Returns a new TracePoint object, not enabled by default. [An example calling it](/examples/builtins-pack-and-trace).
- **`TracePoint#parameters`**: implemented, parameters `[]`. Returns the parameter definitions of the method or block that the current hook belongs to. [An example calling it](/examples/callables-copies-and-visibility).
- **`TracePoint#path`**: implemented, parameters `[]`. Returns the path of the file being executed. [An example calling it](/examples/addresses-uniform-resources).
- **`TracePoint#raised_exception`**: implemented, parameters `[]`. Returns the exception raised on the <code>:raise</code> event or rescued on the <code>:rescue</code> event. [An example calling it](/examples/errors-raising-an-exception-again).
- **`TracePoint#return_value`**: implemented, parameters `[]`. Returns the return value from <code>:return</code>, <code>:c_return</code>, and <code>:b_return</code> events.
- **`TracePoint#self`**: implemented, parameters `[]`. Returns the trace object during the event.
- **`TracePoint.trace`**: implemented, parameters `[[:rest, :events], [:block, :block]]`. A convenience method for TracePoint.new that activates the trace automatically.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
