---
title: "control_flow/case_type_basic.rb"
slug: control-flow-case-type-basic
description: "The metorex example program control_flow/case_type_basic.rb and its output."
---

`tests/_examples/control_flow/case_type_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_type_basic.rb){target=_blank rel=noopener}.

```metorex
# Basic type pattern matching
# Type patterns match based on the runtime type of values

# Integer type
value = 42
case value
when Integer
  puts "It's an integer"
else
  puts "Not an integer"
end

# String type
value = "hello"
case value
when String
  puts "It's a string"
else
  puts "Not a string"
end

# Array type
value = [1, 2, 3]
case value
when Array
  puts "It's an array"
else
  puts "Not an array"
end

# Hash type
value = {"key" => "value"}
case value
when Hash
  puts "It's a hash"
else
  puts "Not a hash"
end

# Multiple type patterns
value = 3.14
case value
when Integer
  puts "Integer"
when Float
  puts "Float"
when String
  puts "String"
else
  puts "Unknown type"
end
```

Output:

```
It's an integer
It's a string
It's an array
It's a hash
Float
```
