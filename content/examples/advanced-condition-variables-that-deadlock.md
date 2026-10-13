---
title: "advanced/condition_variables_that_deadlock.rb"
slug: advanced-condition-variables-that-deadlock
description: "The metorex example program advanced/condition_variables_that_deadlock.rb and its output."
---

`tests/_examples/advanced/condition_variables_that_deadlock.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/condition_variables_that_deadlock.rb){target=_blank rel=noopener}.

```metorex
guard = Mutex.new
signal = ConditionVariable.new
begin
  guard.synchronize { signal.wait(guard) }
rescue Exception => error
  p(error.class)
  puts(error.message.lines.first)
end
```

Output:

```
fatal
No live threads left. Deadlock?
```
