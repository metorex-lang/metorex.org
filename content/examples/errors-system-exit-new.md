---
title: "errors/system_exit_new.rb"
slug: errors-system-exit-new
description: "The metorex example program errors/system_exit_new.rb and its output."
---

`tests/_examples/errors/system_exit_new.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/system_exit_new.rb){target=_blank rel=noopener}.

```metorex
# `SystemExit.new` takes the status first, where true means a clean exit and
# false a failed one, and the message second.
exception = SystemExit.new 42, "message"
puts exception.status.to_s
puts exception.message
puts exception.success?.to_s

puts SystemExit.new(true, "message").status.to_s
puts SystemExit.new(false, "message").status.to_s

# Without a message the exception reports its class name.
puts SystemExit.new(42).message
puts SystemExit.new(42).status.to_s

# A lone message leaves the status at zero.
puts SystemExit.new("message").status.to_s
puts SystemExit.new("message").message
puts SystemExit.new.status.to_s
puts SystemExit.new.message

# A subclass carries a status the same way.
class CustomExit < SystemExit
end

puts CustomExit.new(8).status.to_s
puts CustomExit.new(8).success?.to_s
```

Output:

```
42
message
false
0
1
SystemExit
42
0
message
0
SystemExit
8
false
```
