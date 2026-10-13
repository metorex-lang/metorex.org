---
title: "rescue/retry_in_method_rescue.rb"
slug: rescue-retry-in-method-rescue
description: "The metorex example program rescue/retry_in_method_rescue.rb and its output."
---

`tests/_examples/rescue/retry_in_method_rescue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/retry_in_method_rescue.rb).

```metorex
def load_once(attempts)
  attempts << :tried
  raise ArgumentError, "first try" if attempts.size < 2

  attempts
rescue ArgumentError
  retry
end

p load_once([])

def load_with_condition(attempts)
  attempts << :tried
  raise ArgumentError, "first try" if attempts.size < 3

  attempts
rescue ArgumentError
  attempts.size < 3 ? retry : raise
end

p load_with_condition([])

def give_up(attempts)
  attempts << :tried
  raise ArgumentError, "always"
rescue ArgumentError
  attempts.size < 2 ? retry : raise
end

begin
  give_up([])
rescue ArgumentError => error
  p error.message
end

def retry_with_if(attempts)
  attempts << :tried
  raise ArgumentError, "first try" if attempts.size < 2

  attempts
rescue ArgumentError
  retry if attempts.size < 2
end

p retry_with_if([])
```

Output:

```
[:tried, :tried]
[:tried, :tried, :tried]
"always"
[:tried, :tried]
```
