---
title: "introspection/set_trace_func_events.rb"
slug: introspection-set-trace-func-events
description: "The metorex example program introspection/set_trace_func_events.rb and its output."
---

`tests/_examples/introspection/set_trace_func_events.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/set_trace_func_events.rb).

```metorex
# set_trace_func hands each line, call, return and raise to a proc with the
# event's name, file, line, method, binding and class, until it is set to nil.
events = []
tracer = proc do |event, file, line, id, binding, klass|
  next unless %w[line call return raise].include?(event)

  events << [event, File.basename(file), line, id, klass, binding.class]
end

def add_one(number)
  total = number + 1
  total
end

def refuse(reason)
  raise(ArgumentError, reason)
rescue ArgumentError
  :refused
end

p(set_trace_func(tracer).equal?(tracer))
add_one(1)
refuse("bad")
set_trace_func(nil)
add_one(2)
events.each { |event| p(event) }

begin
  set_trace_func(:not_a_proc)
rescue TypeError => error
  p(error.message)
end
```

Output:

```
true
["line", "set_trace_func_events.rb", 22, nil, nil, Binding]
["call", "set_trace_func_events.rb", 10, :add_one, Object, Binding]
["line", "set_trace_func_events.rb", 11, :add_one, Object, Binding]
["line", "set_trace_func_events.rb", 12, :add_one, Object, Binding]
["return", "set_trace_func_events.rb", 13, :add_one, Object, Binding]
["line", "set_trace_func_events.rb", 23, nil, nil, Binding]
["call", "set_trace_func_events.rb", 15, :refuse, Object, Binding]
["line", "set_trace_func_events.rb", 16, :refuse, Object, Binding]
["raise", "set_trace_func_events.rb", 16, :refuse, Object, Binding]
["line", "set_trace_func_events.rb", 18, :refuse, Object, Binding]
["return", "set_trace_func_events.rb", 19, :refuse, Object, Binding]
["line", "set_trace_func_events.rb", 24, nil, nil, Binding]
"trace_func needs to be Proc"
```
