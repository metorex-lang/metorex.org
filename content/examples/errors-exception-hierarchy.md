---
title: "errors/exception_hierarchy.rb"
slug: errors-exception-hierarchy
description: "The metorex example program errors/exception_hierarchy.rb and its output."
---

`tests/_examples/errors/exception_hierarchy.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/exception_hierarchy.rb).

```metorex
# Exception Hierarchy Example
# Demonstrates the standard exception types and their inheritance

# Example 1: Catching different exception types
puts "Example 1: Different exception types"

begin
  raise RuntimeError.new("Runtime error occurred")
rescue RuntimeError => e
  puts "Caught RuntimeError: #{e.message}"
end

begin
  raise TypeError.new("Type mismatch")
rescue TypeError => e
  puts "Caught TypeError: #{e.message}"
end

begin
  raise ArgumentError.new("Invalid value")
rescue ArgumentError => e
  puts "Caught ArgumentError: #{e.message}"
end

# Example 2: Catching base StandardError
puts ""
puts "Example 2: Catching StandardError"

begin
  raise RuntimeError.new("A runtime error")
rescue StandardError => e
  puts "Caught as StandardError: #{e.message}"
end

begin
  raise TypeError.new("A type error")
rescue StandardError => e
  puts "Caught as StandardError: #{e.message}"
end

# Example 3: Exception hierarchy - more specific catches first
puts ""
puts "Example 3: Specific to general exception handling"

def handle_error(error_type)
  begin
    if error_type == "runtime"
      raise RuntimeError.new("Runtime issue")
    elsif error_type == "type"
      raise TypeError.new("Type issue")
    elsif error_type == "value"
      raise ArgumentError.new("Value issue")
    end
  rescue RuntimeError => e
    puts "Specific handler for RuntimeError: #{e.message}"
  rescue TypeError => e
    puts "Specific handler for TypeError: #{e.message}"
  rescue StandardError => e
    puts "General handler for StandardError: #{e.message}"
  end
end

handle_error("runtime")
handle_error("type")
handle_error("value")

# Example 4: Demonstrating exception inheritance
puts ""
puts "Example 4: Exception type checking"

begin
  raise RuntimeError.new("Test error")
rescue StandardError => e
  puts "RuntimeError is a StandardError: true"
  puts "Error message: #{e.message}"
end
```

Output:

```
Example 1: Different exception types
Caught RuntimeError: Runtime error occurred
Caught TypeError: Type mismatch
Caught ArgumentError: Invalid value

Example 2: Catching StandardError
Caught as StandardError: A runtime error
Caught as StandardError: A type error

Example 3: Specific to general exception handling
Specific handler for RuntimeError: Runtime issue
Specific handler for TypeError: Type issue
General handler for StandardError: Value issue

Example 4: Exception type checking
RuntimeError is a StandardError: true
Error message: Test error
```
