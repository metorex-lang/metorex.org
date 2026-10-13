---
title: "syntax/retry_and_rescue.rb"
slug: syntax-retry-and-rescue
description: "The metorex example program syntax/retry_and_rescue.rb and its output."
---

`tests/_examples/syntax/retry_and_rescue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/retry_and_rescue.rb).

```metorex
# `retry` runs the begin body again from the top. It is only written inside a
# rescue body, and the rescue decides when to stop asking.
attempts = 0
begin
  attempts += 1
  raise "not yet" if attempts < 4
  outcome = :done
rescue
  retry
end
p [attempts, outcome]

# A nested begin retries its own body rather than the one around it.
outer = 0
inner = 0
begin
  outer += 1
  begin
    inner += 1
    raise "inner" if inner < 3
  rescue
    retry
  end
  raise "outer" if outer < 2
rescue
  retry
end
p [outer, inner]

begin
  eval "retry"
rescue SyntaxError => problem
  puts "refused outside a rescue"
end
```

Output:

```
[4, :done]
[2, 4]
refused outside a rescue
```
