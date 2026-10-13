---
title: "errors/ensure_return_drops_error.rb"
slug: errors-ensure-return-drops-error
description: "The metorex example program errors/ensure_return_drops_error.rb and its output."
---

`tests/_examples/errors/ensure_return_drops_error.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/ensure_return_drops_error.rb).

```metorex
# An ensure clause that leaves by `return` drops the exception in flight, so
# `$!` names whatever it named before the begin.

def dropped
  begin
    raise("lost")
  ensure
    return(:returned)
  end
end

p(dropped)
p($!)

begin
  raise("outer")
rescue
  p(dropped)
  p($!.message)
end
```

Output:

```
:returned
nil
:returned
"outer"
```
