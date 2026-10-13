---
title: "metaprogramming/advanced/method/delegation_no_parens.rb"
slug: metaprogramming-advanced-method-delegation-no-parens
description: "The metorex example program metaprogramming/advanced/method/delegation_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/advanced/method/delegation_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/advanced/method/delegation_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Method Delegation without parentheses (where possible)

class Logger
  def log(message)
    puts "[LOG] #{message}"
  end
end

class Service
  def initialize
    @logger = Logger.new
  end

  def process(data)
    @logger.log("Processing: #{data}")
    "processed: #{data}"
  end
end

puts "=== Simple Delegation ==="
service = Service.new
puts service.process("input data")

class Delegator
  def initialize(target)
    @target = target
  end

  def delegate(method_name)
    @target
  end
end

puts ""
puts "=== Dynamic Delegation ==="
logger = Logger.new
d = Delegator.new(logger)
target = d.delegate("log")
target.log("delegated message")

class LoggingProxy
  def initialize(target)
    @target = target
  end

  def call(method_name, arg)
    puts "Before: #{method_name}"
    result = @target.process(arg)
    puts "After: #{method_name} -> #{result}"
    result
  end
end

puts ""
puts "=== Forwarding with Hooks ==="
proxy = LoggingProxy.new(Service.new)
proxy.call("process", "test data")
```

Output:

```
=== Simple Delegation ===
[LOG] Processing: input data
processed: input data

=== Dynamic Delegation ===
[LOG] delegated message

=== Forwarding with Hooks ===
Before: process
[LOG] Processing: test data
After: process -> processed: test data
```
