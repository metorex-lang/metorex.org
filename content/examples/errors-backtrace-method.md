---
title: "errors/backtrace_method.rb"
slug: errors-backtrace-method
description: "The metorex example program errors/backtrace_method.rb and its output."
---

`tests/_examples/errors/backtrace_method.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/backtrace_method.rb){target=_blank rel=noopener}.

```metorex
# Backtrace method example

class ErrorDemo
  def outer
    self.middle
  end

  def middle
    self.inner
  end

  def inner
    raise("Error in inner method")
  end
end

begin
  demo = ErrorDemo.new
  demo.outer
rescue => e
  puts "Caught: #{e.message}"

  trace = e.backtrace
  puts "Backtrace array length: #{trace.length}"

  # Print first few frames
  if trace.length > 0
    puts "First frame: #{trace[0]}"
  end
end
```

Output:

```
Caught: Error in inner method
Backtrace array length: 4
First frame: tests/_examples/errors/backtrace_method.rb:13:in 'ErrorDemo#inner'
```
