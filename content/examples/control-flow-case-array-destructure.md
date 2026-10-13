---
title: "control_flow/case_array_destructure.rb"
slug: control-flow-case-array-destructure
description: "The metorex example program control_flow/case_array_destructure.rb and its output."
---

`tests/_examples/control_flow/case_array_destructure.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_array_destructure.rb).

```metorex
# Array destructuring in case/when statements

# Simple array destructuring
arr = [1, 2, 3]
case arr
  when [a, b, c]
    puts "a=#{a}, b=#{b}, c=#{c}"
end

# Array with rest pattern
numbers = [1, 2, 3, 4, 5]
case numbers
  when [first, ...rest]
    puts "First: #{first}"
    puts "Rest: #{rest}"
end

# Rest in the middle
case numbers
  when [first, ...middle, last]
    puts "First: #{first}, Last: #{last}"
    puts "Middle: #{middle}"
end

# Nested array patterns
data = [[1, 2], [3, 4]]
case data
  when [[a, b], [c, d]]
    sum = a + b + c + d
    puts "Sum: #{sum}"
end

# Wildcard in array patterns
data2 = [1, 2, 3, 4]
case data2
  when [1, _, _, last]
    puts "First is 1, last is #{last}"
end
```

Output:

```
a=1, b=2, c=3
First: 1
Rest: [2, 3, 4, 5]
First: 1, Last: 5
Middle: [2, 3, 4]
Sum: 10
First is 1, last is 4
```
