---
title: "errors/stack_trace_deep.rb"
slug: errors-stack-trace-deep
description: "The metorex example program errors/stack_trace_deep.rb and its output."
---

`tests/_examples/errors/stack_trace_deep.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/stack_trace_deep.rb).

```metorex
# Deep stack trace example

class Deep
  def level1
    self.level2
  end

  def level2
    self.level3
  end

  def level3
    self.level4
  end

  def level4
    raise("Error at level 4!")
  end
end

begin
  obj = Deep.new
  obj.level1
rescue => e
  puts e.message
  backtrace = e.backtrace
  puts "Stack trace has #{backtrace.length} frames"
end
```

Output:

```
Error at level 4!
Stack trace has 5 frames
```
