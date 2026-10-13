---
title: "rescue/raise_instance_without_cause.rb"
slug: rescue-raise-instance-without-cause
description: "The metorex example program rescue/raise_instance_without_cause.rb and its output."
---

`tests/_examples/rescue/raise_instance_without_cause.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/raise_instance_without_cause.rb).

```metorex
def reraise_plain
  raise "original"
rescue => error
  raise ArgumentError.new("replacement")
end

def reraise_without_cause
  raise "original"
rescue => error
  replacement = NameError.new("replacement", :name)
  replacement.set_backtrace(error.backtrace)
  raise replacement, cause: nil
end

begin
  reraise_plain
rescue => error
  p error.cause&.message
end

begin
  reraise_without_cause
rescue => error
  p error.cause
end
```

Output:

```
"original"
nil
```
