---
title: "advanced/exception_handling.rb"
slug: advanced-exception-handling
description: "The metorex example program advanced/exception_handling.rb and its output."
---

`tests/_examples/advanced/exception_handling.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/exception_handling.rb).

```metorex

def risky_operation()
  puts 'risky operation!'
  raise 'Oops...'
end

def cleanup()
  puts 'cleanup'
end

begin
  risky_operation()
rescue StandardError => e
  puts "General error: #{e.message}"
ensure
  cleanup()
end
```

Output:

```
risky operation!
General error: Oops...
cleanup
```
