---
title: "errors/error_location.rb"
slug: errors-error-location
description: "The metorex example program errors/error_location.rb and its output."
---

`tests/_examples/errors/error_location.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/error_location.rb).

```metorex
# Error location tracking example

def dangerous_operation(x)
  if x < 0
    raise("Negative value not allowed")
  end
  x * 2
end

def process(value)
  dangerous_operation(value)
end

begin
  process(-5)
rescue => e
  puts "Error: #{e.message}"
  puts "Type: #{e.type}"
end
```

Output:

```
Error: Negative value not allowed
Type: RuntimeError
```
