---
title: "control_flow/case_variable_binding.rb"
slug: control-flow-case-variable-binding
description: "The metorex example program control_flow/case_variable_binding.rb and its output."
---

`tests/_examples/control_flow/case_variable_binding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_variable_binding.rb){target=_blank rel=noopener}.

```metorex
# Case statements with variables

# Simple variable
value = 42
x = value
puts "Matched: #{x}"

# Multiple cases
status = 404
case status
when 200
  puts "OK"
when 404
  puts "Not Found"
when 500
  puts "Internal Server Error"
else
  puts "Status code: #{status}"
end

# Conditional logic
age = 25
if age >= 18
  if age < 65
    puts "Working age: #{age}"
  else
    puts "Retirement age: #{age}"
  end
elsif age < 18
  puts "Minor: #{age}"
else
  puts "Retirement age: #{age}"
end
```

Output:

```
Matched: 42
Not Found
Working age: 25
```
