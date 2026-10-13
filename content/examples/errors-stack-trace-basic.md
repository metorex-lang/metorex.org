---
title: "errors/stack_trace_basic.rb"
slug: errors-stack-trace-basic
description: "The metorex example program errors/stack_trace_basic.rb and its output."
---

`tests/_examples/errors/stack_trace_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/stack_trace_basic.rb).

```metorex
# Basic stack trace example

class Calculator
  def divide(x, y)
    self.validate(y)
    x / y
  end

  def validate(value)
    if value == 0
      raise("Division by zero!")
    end
  end
end

begin
  calc = Calculator.new
  calc.divide(10, 0)
rescue => e
  # `to_s` is the message alone; the class and the backtrace are their own
  # methods.
  puts e.to_s
  puts e.class.to_s
  puts e.message
  puts e.backtrace.class.to_s
end
```

Output:

```
Division by zero!
RuntimeError
Division by zero!
Array
```
