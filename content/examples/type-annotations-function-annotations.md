---
title: "type_annotations/function_annotations.rb"
slug: type-annotations-function-annotations
description: "The metorex example program type_annotations/function_annotations.rb and its output."
---

`tests/_examples/type_annotations/function_annotations.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/type_annotations/function_annotations.rb){target=_blank rel=noopener}.

```metorex
def greet(name, age)  # str, int -> str
  "Hello, " + name
end

def add(a, b)  # int, int -> int
  a + b
end

def multiply(x, y)  # float, float -> float
  x * y
end

message = greet("Bob", 25)
puts message

sum_result = add(10, 20)
puts "10 + 20 = #{sum_result}"

product = multiply(3.5, 2.0)
puts "3.5 * 2.0 = #{product}"
```
