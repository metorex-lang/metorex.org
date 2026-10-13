---
title: "errors/simple_rescue.rb"
slug: errors-simple-rescue
description: "The metorex example program errors/simple_rescue.rb and its output."
---

`tests/_examples/errors/simple_rescue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/simple_rescue.rb).

```metorex
# Simple exception handling example

# Example 1: Basic rescue without exception type
begin
  puts "Before exception"
  raise "Something went wrong"
  puts "This should not print"
rescue
  puts "Caught an exception"
end

puts "After rescue block"

# Example 2: Rescue with exception binding
begin
  raise "An error message"
rescue => e
  puts "Caught exception with message: #{e}"
end

# Example 3: Ensure block always runs
begin
  puts "In try block"
  raise "Error"
rescue
  puts "In rescue block"
ensure
  puts "In ensure block"
end
```

Output:

```
Before exception
Caught an exception
After rescue block
Caught exception with message: An error message
In try block
In rescue block
In ensure block
```
