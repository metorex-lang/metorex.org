---
title: "control_flow/case_object_destructure.rb"
slug: control-flow-case-object-destructure
description: "The metorex example program control_flow/case_object_destructure.rb and its output."
---

`tests/_examples/control_flow/case_object_destructure.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_object_destructure.rb){target=_blank rel=noopener}.

```metorex
# Object/Dictionary access in case/when statements
# Note: Standard Ruby doesn't support destructuring in case statements
# This demonstrates the pattern using regular hash access

# Working with point hash
point = {"x" => 10, "y" => 20}
case point
when Hash
  x = point["x"]
  y = point["y"]
  puts "Point at (#{x}, #{y})"
end

# Working with person hash
person = {"name" => "Alice", "age" => 30}
case person
when Hash
  n = person["name"]
  a = person["age"]
  puts "Name: #{n}, Age: #{a}"
end

# Another example
case person
when Hash
  name = person["name"]
  years = person["age"]
  puts "#{name} is #{years} years old"
end
```

Output:

```
Point at (10, 20)
Name: Alice, Age: 30
Alice is 30 years old
```
