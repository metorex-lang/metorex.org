---
title: "introspection/tracepoint_call_in_block_no_parens.rb"
slug: introspection-tracepoint-call-in-block-no-parens
description: "The metorex example program introspection/tracepoint_call_in_block_no_parens.rb and its output."
---

`tests/_examples/introspection/tracepoint_call_in_block_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/tracepoint_call_in_block_no_parens.rb).

```metorex
# A :call event names the method, file, and line of a method defined and
# called inside a block, written here with as few parentheses as Ruby allows.

def run_it
  yield
end

class Runner
  def run(&block)
    Object.new.instance_exec(&block)
  end
end

seen = []
run_it do
  TracePoint.new(:call) { |trace| seen << [trace.method_id, trace.lineno] }.enable do
    def defined_in_block; end
    defined_in_block
  end
end
p seen

inspected = []
Runner.new.run do
  TracePoint.new(:call) { |trace|
    next unless trace.path == __FILE__
    inspected << trace.inspect.sub(__FILE__, "FILE")
  }.enable do
    def defined_in_instance_exec; end
    defined_in_instance_exec
  end
end
p inspected

paths = []
Runner.new.run do
  TracePoint.new(:call) { |trace| paths << [trace.method_id, trace.path == __FILE__] }.enable do
    def defined_again; end
    defined_again
  end
end
p paths
p Runner.private_instance_methods(false).include?(:defined_again)
```

Output:

```
[[:defined_in_block, 17]]
["#<TracePoint:call 'defined_in_instance_exec' FILE:29>"]
[[:defined_again, true]]
false
```
