---
title: "control_flow/case_type_mixed.rb"
slug: control-flow-case-type-mixed
description: "The metorex example program control_flow/case_type_mixed.rb and its output."
---

`tests/_examples/control_flow/case_type_mixed.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_type_mixed.rb){target=_blank rel=noopener}.

```metorex
# Mixed patterns: combining type patterns with other patterns

# Type patterns for different numeric types
value = 42
case value
when Integer
  puts "It's an integer: #{value}"
when Float
  puts "It's a float: #{value}"
else
  puts "Not a number"
end

# Type pattern followed by literal pattern
value = "hello"
case value
when String
  puts "Generic string"
when "specific"
  puts "Specific string"
end

# Using type patterns to handle different data types uniformly
def process(data)
  case data
  when Integer
    puts "Processing integer: #{data * 2}"
  when Float
    puts "Processing float: #{data * 1.5}"
  when String
    puts "Processing string: #{data.upcase}"
  when Array
    puts "Processing array of #{data.length} elements"
  when Hash
    puts "Processing hash with #{data.keys.length} keys"
  else
    puts "Unknown data type"
  end
end

process(10)
process(3.14)
process("test")
process([1, 2, 3])
process({"a" => 1, "b" => 2})
```

Output:

```
It's an integer: 42
Generic string
Processing integer: 20
Processing float: 4.71
Processing string: TEST
Processing array of 3 elements
Processing hash with 2 keys
```
